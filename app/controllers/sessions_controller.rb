class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where(email: user_params[:email]).first
    if @user.blank?
      @user = User.new(user_params.merge(password_confirmation: user_params[:password], 
                                         nickname: user_params[:email][/^(.*)@/, 1]))
      unless @user.save
        return render action: :new, alert: @user.errors.full_messages
      end
    elsif !@user.authenticate(user_params[:password])
      return render action: :new, alter: "密码错误"
    end
    redirect_to root_path, notice: '欢迎来到 Rails-Night 的家园'
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
