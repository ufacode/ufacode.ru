# frozen_string_literal: true
module PostsHelper
  include ActsAsTaggableOn::TagsHelper
  def show_tags(post)
    return unless post.tags.any?

    out = []
    post.tags.each do |tag|
      out << link_to(tag.name, posts_path(tag: tag.name), class: 'tag label label-default')
    end
    out.join('').html_safe
  end
end
