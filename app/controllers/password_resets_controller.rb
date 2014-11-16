class PasswordResetsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user
      OrderMailer.send_password_reset_link(user).deliver
      render template: '/password_resets/confirm_password_reset'
      false
    else
      flash[:danger] = params[:email].blank? ? "Email can't be blank." : "Email invalid."
      redirect_to reset_password_path
    end
  end

  def edit
    @user = User.find_by(token: params[:id])
    redirect_to expired_token_path unless @user
  end

  def update
    @user = User.find_by(token: params[:id])
    if @user
      @user.password = params[:user][:password]
      @user.generate_token
      @user.save
      flash[:success] = "Password has been changed."
      redirect_to signin_path
    else
      redirect_to expired_token_path
    end
  end
end
