# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    return unless @comment.save

    redirect_to @post, notice: I18n.t('comments.published')
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
