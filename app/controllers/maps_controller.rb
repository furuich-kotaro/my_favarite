class MapsController < ApplicationController
  def index
    @posts = Post.all
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow post.address
      marker.infowindow render_to_string(partial: 'shard/infowindow', locals: { post: post })
    end
  end
end
