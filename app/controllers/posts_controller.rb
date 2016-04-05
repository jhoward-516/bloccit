class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @posts = Post.new
  end

  def edit
  end
end
