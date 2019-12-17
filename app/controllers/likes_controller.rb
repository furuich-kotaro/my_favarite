class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def index
    likes = Like.where(user_id: params[:id]).pluck(:post_id)
    @posts = Post.where(id: likes).includes(:taggings, :user).page(params[:page]).per(9).order('created_at DESC')
    @like = Like.new
  end

  def create
    @like = current_user.likes.create(post_id: params[:post_id])
    @post.reload
  end

  def destroy
    @like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    @like.destroy
    @post.reload
  end

  def search
    likes = Like.where(user_id: params[:id]).pluck(:post_id)
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).where(id: likes).includes(:taggings, :user).page(params[:page]).per(9).order('created_at DESC')
    @like = Like.new
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def search_params
    params.require(:q).permit(:address_cont)
  end
end
