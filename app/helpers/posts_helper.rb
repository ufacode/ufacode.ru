module PostsHelper
  def only_for_owner(post, &block)
    yield block if user_signed_in? && (current_user == blog.author)
  end
end