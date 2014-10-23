class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has been created.'
      if session[:intended_destination]
        session[:user_id] = @user.id
        redirect_to session[:intended_destination]
        session[:intended_destination] = nil
      else
        redirect_to @user
      end
    else
      flash[:danger] = 'User has not been created.'
      render :new
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
