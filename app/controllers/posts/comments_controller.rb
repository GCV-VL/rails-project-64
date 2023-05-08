# frozen_string_literal: true

module Posts
  class CommentsController < ApplicationController
    before_action :authenticate_user!

    def create
      @comment = resource_post.comments.build comment_params
      @comment.user = current_user

      if @comment.save
        redirect_to resource_post, notice: t('.success')
      else
        redirect_to resource_post, alert: @comment.errors.full_messages.first
      end
    end

    private

    def comment_params
      params.required(:post_comment).permit(:content, :parent_id)
    end
  end
end
