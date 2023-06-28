# frozen_string_literal: true

require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    sign_in(users(:one))
  end

  test 'should create comment' do
    post = posts(:one)
    comment_params = { post: post, content: FFaker::Lorem.paragraph(10) }
    post post_post_comments_url(post), params: { post_comment: comment_params }
    assert_redirected_to post_url(post)
  end
end
