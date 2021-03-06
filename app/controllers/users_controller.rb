class UsersController < ApplicationController


  def new

  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      flash[:notice] = "Account created"
      redirect_to root_path
    else
      flash[:alert] = "Try again!"
      redirect_to :back
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
