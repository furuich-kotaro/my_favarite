class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create destroy]

  def index
    @posts = @q.result(distinct: true).includes(:user, :taggings).page(params[:page]).per(9).order('created_at DESC')
    @like = Like.new
    @tags = ActsAsTaggableOn::Tag.most_used(10)
    @posts = @posts.tagged_with(params[:tag_name].to_s) if params[:tag_name]
  end

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

  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = '削除に成功しました'
    redirect_back(fallback_location: root_path)
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).includes(:user, :taggings).page(params[:page]).per(9).order('created_at DESC')
    @like = Like.new
  end

  private

  def post_params
    params.require(:post).permit(:address, :description, :tag_list, :latitude, :longitude, pictures: []).merge(user_id: current_user.id)
  end

  def search_params
    params.require(:q).permit(:address_cont)
  end
end
