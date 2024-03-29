# frozen_string_literal: true

require 'test_helper'

module PostsControllerTest
  class AsGuest < ActionDispatch::IntegrationTest
    test 'should get show' do
      get post_url(posts(:one))
      assert_response :success
    end
  end

  class AsSignedUser < ActionDispatch::IntegrationTest
    include Devise::Test::IntegrationHelpers

    setup do
      sign_in(users(:one))
    end

    test 'should get new' do
      get new_post_url
      assert_response :success
    end

    test 'should get edit' do
      get edit_post_url(posts(:one))
      assert_response :success
    end

    test 'should get show' do
      get post_url(posts(:one))
      assert_response :success
    end

    test 'should create post' do
      post_params = { creator: users(:one), title: Faker::Lorem.sentence, category_id: categories(:one).id, body: Faker::Lorem.paragraphs(number: 10).join("\n") }
      post posts_url, params: { post: post_params }
      assert_redirected_to post_url(Post.last)
    end

    test 'should update post' do
      title = Faker::Lorem.sentence
      body = Faker::Lorem.paragraphs(number: 10).join("\n")
      post = posts(:one)
      post_params = { creator: users(:one), title:, category_id: categories(:one).id, body: }

      put post_url(post), params: { post: post_params }

      assert_redirected_to post_url(post)
      assert_equal(title, post.reload.title)
      assert_equal(body, post.reload.body)
    end
  end
end
