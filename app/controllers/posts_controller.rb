class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = '投稿に成功しました'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit; end

  def update; end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = '削除に成功しました'
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:address, :description, :latitude, :longitude, pictures: []).merge(user_id: current_user.id)
  end
end
