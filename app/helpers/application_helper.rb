# frozen_string_literal: true
module ApplicationHelper
  def clean_post(html)
    sanitize html, tags: %w(strong em a p br bold img strike blockquote cite b u table tr td video iframe pre code), attributes: %w(href src class rel target)
  end

  def clean_comment(html)
    sanitize html, tags: %w(strong em a p br bold img strike blockquote cite b u), attributes: %w(href src)
  end

  ##
  # Show form validation errors
  def form_errors(form, show_field = true)
    html = ''
    if form.errors.any?
      plural = Russian.pluralize(form.errors.count, 'ошибка', 'ошибки', 'ошибок')
      html = %(
        <div class="alert">
          <big>#{form.errors.count} #{plural} в форме:</big>
          <hr/>
          <ul>
      )
      form.errors.each do |field, msg|
        html += show_field ? %(<li>поле "#{field}" #{msg}</li>) : "<li>#{msg}</li>"
      end
      html += %(
        </ul>
      </div>
      )
    end
    raw(html)
  end

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true,
      space_after_headers: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end

  ##
  # Show flash messages
  def flash_message(flash)
    out = ''
    unless flash.empty?
      out = '<script type="text/javascript" data-turbolinks-eval="always">'
      flash.each do |f|
        type = f[0].to_s.gsub('alert', 'error').gsub('notice', 'success')
        out << %{ toastr['#{type}']('#{f[1]}'); }
      end
      out << '</script>'
    end
    out.html_safe
  end
end
