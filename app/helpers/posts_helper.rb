module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def rate_post_button(post, _user, action)
    url = rate_post_path(post, format: :json)
    if action == :like
      updown = 'up'
    else
      updown = 'down'
      flip   = 'fa-flip-horizontal'
    end
    %(
      <span class="post-rate post-#{action} glyphicon glyphicon-thumbs-#{updown} #{flip}" data-url="#{url}" data-act="#{action}"></span>
        ).html_safe # возвращаемый html элемент (кнопка)
  end

  def show_tags(post)
    return unless post.tags.any?

    out = ''
    post.tags.each do |tag|
      out << link_to(tag.name, posts_path(tag: tag.name), class: 'tag label label-default')
    end
    out.html_safe
  end
end
