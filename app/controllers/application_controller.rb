class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_racsack
  before_action :set_notifications

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name image])
  end

  def set_racsack
    @q = Post.ransack(params[:q])
  end

  def create_google_map_marker
    @hash = Gmaps4rails.build_markers(@posts) do |post, marker|
      marker.lat post.latitude
      marker.lng post.longitude
      marker.infowindow post.address
      marker.infowindow render_to_string(partial: 'shard/infowindow', locals: { post: post })
    end
  end

  def set_notifications
    @notifications = current_user.passive_notifications.where(checked: false).includes(:visitor, :post) if signed_in?
  end
end
