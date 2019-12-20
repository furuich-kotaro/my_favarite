class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications_list = current_user.passive_notifications.includes(:visitor, :post).page(params[:page]).per(20)
  end

  def update
    current_user.passive_notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
