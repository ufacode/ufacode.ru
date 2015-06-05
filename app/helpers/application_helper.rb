module ApplicationHelper
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
        out << %Q{ toastr['#{type}']('#{f[1]}'); }
      end
      out << '</script>'
    end
    out.html_safe
  end
end
