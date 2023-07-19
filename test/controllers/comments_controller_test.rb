# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users(:one))
  end

  test 'create comment' do
    post = posts(:one)
    comment_params = { post:, content: Faker::Lorem.paragraph }
    post post_comments_url(post), params: { post_comment: comment_params }
    assert_equal(users(:one).id, PostComment.last.user_id)
    assert_redirected_to post_url(post)
  end

  test 'create child comment' do
    post = posts(:one)
    comment_params = { post:, content: Faker::Lorem.paragraph, parent_id: post_comments(:one).id }
    post post_comments_url(post), params: { post_comment: comment_params }
    assert_equal(post_comments(:one).id, PostComment.last.parent&.id)
    assert_redirected_to post_url(post)
  end
end
