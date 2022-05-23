class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def after_sign_out_path_for scope
    scope
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
