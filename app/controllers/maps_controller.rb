class MapsController < ApplicationController
  def index
    @posts = @q.result(distinct: true).includes(:user, :taggings)
    create_google_map_marker
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).includes(:user, :taggings)
    create_google_map_marker
  end

  private

  def search_params
    params.require(:q).permit(:address_cont)
  end
end
