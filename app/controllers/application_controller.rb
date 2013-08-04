class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user


  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user= user
    @current_user = user
    session[:user_id] = user.try(:id)
  end

  def require_login
    unless current_user
      flash[:error] = "亲，你需要先登录哦！"
      redirect_to login_in_path
    end
  end
end
