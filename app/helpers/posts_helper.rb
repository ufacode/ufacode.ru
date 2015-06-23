module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  
  def rate_post_button(post, user, action)
    url = rate_post_path(post, format: :json)
    if action == :like
      updown = 'up'
    else
      updown = 'down'
      flip   = 'fa-flip-horizontal'
    end
    %Q{
      <span class="post-rate post-#{action} glyphicon glyphicon-thumbs-#{updown} #{flip}" data-url="#{url}" data-act="#{action}"></span>
    }.html_safe #возвращаемый html элемент (кнопка)
  end

end
