class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  private

  def logged_in?
    !!current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate
    redirect_to root_path, alert: "ログインして下さい" unless logged_in?
  end
end
