require "test_helper"

class LikesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:two)
    sign_in(@user)
  end

  test 'should create like' do
    post = posts(:one)
    like_params = { post: post, user: @user }
    assert_equal(2, PostLike.count)
    post post_post_likes_url(post), params: { post_like: like_params }
    assert_equal(3, PostLike.count)
    assert_redirected_to post_url(post)
  end

  test 'should destroy all likes for post and user' do
    post = posts(:two)
    assert_equal(1, post.likes.where(user: @user).count)
    delete post_post_like_url(post, post.likes.where(user: @user).last)
    assert_equal(0, post.likes.where(user: @user).count)
    assert_redirected_to post_url(post)
  end
end
