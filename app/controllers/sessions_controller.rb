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
        return render action: :new
      end
    elsif !@user.authenticate(user_params[:password])
      return redirect_to login_in_path, alert: "密码错误"
    end
    self.current_user = @user
    redirect_to root_path, notice: '欢迎来到 Rails-Night 的家园'
  end

  def destroy
    self.current_user = nil
    redirect_to root_path
  end


  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
