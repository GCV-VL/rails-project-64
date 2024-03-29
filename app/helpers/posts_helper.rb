# frozen_string_literal: true

module PostsHelper
  def like_exists?(post)
    post.likes.exists?(user: current_user)
  end
end
