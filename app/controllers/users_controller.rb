class UsersController < ApplicationController
  def show
    @posts = @q.result(distinct: true).includes(:user, :taggings).where(user_id: params[:id]).page(params[:page]).per(30).order('created_at DESC')
    @like = Like.new
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).includes(:user, :taggings).where(user_id: params[:id]).page(params[:page]).per(30).order('created_at DESC')
    @like = Like.new
  end

  private

  def search_params
    params.require(:q).permit(:address_cont)
  end
end
