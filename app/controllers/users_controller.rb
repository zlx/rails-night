class UsersController < ApplicationController
  before_action :require_login
  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if !@user.authenticate(user_params[:current_password])
      redirect_to users_edit_path, alert: '密码输入错误'
    elsif !@user.update_attributes(user_params)
      redirect_to users_edit_path, alert: @user.errors.full_messages
    else
      redirect_to root_path, notice: '修改成功'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :nickname, :avatar_url, :password, 
                                 :password_confirmation, :current_password)
  end
end
