class SessionsController < ApplicationController
  def new
    redirect_to root_path if current_user
  end

  def create
    if user = User.authenticate(params[:email], params[:password])
      session[:user_id] = user.id
      flash[:success] = "Sign in successful."
      if session[:intended_destination]
        redirect_to session[:intended_destination]
        session[:intended_destination] = nil
      else
        redirect_to root_path
      end
    else
      flash.now[:danger] = "Invalid email/password combination."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been signed out."
    redirect_to root_path
  end
end
