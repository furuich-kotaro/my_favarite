class MapsController < ApplicationController
  def index
    @posts = @q.result(distinct: true).includes(:user, :taggings)
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow post.address
      marker.infowindow render_to_string(partial: 'shard/infowindow', locals: { post: post })
    end
  end

  def search
    @q = Post.search(search_params)
    @posts = @q.result(distinct: true).includes(:user, :taggings)
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow post.address
      marker.infowindow render_to_string(partial: 'shard/infowindow', locals: { post: post })
    end
  end

  private

  def search_params
    params.require(:q).permit(:address_cont)
  end
end
