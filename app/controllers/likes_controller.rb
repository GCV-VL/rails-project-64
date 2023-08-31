# frozen_string_literal: true

class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    if @post.likes.exists?(user: current_user)
      head :ok
    else
      @like = @post.likes.create(user: current_user)
      redirect_to @post, notice: I18n.t('likes.published')
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.likes.where(user: current_user).destroy_all
    redirect_to @post, notice: I18n.t('likes.unpublished')
  end
end
