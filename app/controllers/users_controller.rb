class UsersController < ApplicationController
  before_action :set_user, except: [:show, :search]
  before_action :authenticate_user!, except: [:show, :search]

  def show
    @posts = Post.where(user_id: params[:id]).includes(:user, :taggings).page(params[:page]).per(9).order('created_at DESC')
    @like = Like.new
    @user = User.find(params[:id]) if @posts.empty?
    create_google_map_marker
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).includes(:user, :taggings).where(user_id: params[:id]).page(params[:page]).per(9).order('created_at DESC')
    @user = User.find(params[:id]) if @posts.empty?
    @like = Like.new
    create_google_map_marker
  end

  def follow
    current_user.follow(@user)
    @user.create_notification_follow!(current_user)
  end

  def unfollow
    current_user.stop_following(@user)
  end

  def follow_list
    @follow_list = @user.all_following
  end

  def follower_list
    @follower_list = @user.followers
  end

  private

  def search_params
    params.require(:q).permit(:address_cont)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
