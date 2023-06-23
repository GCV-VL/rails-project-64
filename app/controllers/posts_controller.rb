# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def new 
    @post = Post.new
  end

  def edit; end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.creator = current_user

    if @post.save
      redirect_to @post, notice: I18n.t("posts.published")
    else
      puts @post.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :category_id, :body)
  end
end
