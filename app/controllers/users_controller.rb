class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def new
    @user = User.new
    @user.addresses.build
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User has been created.'
      redirect_to signin_path
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
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation,
                                  addresses_attributes: [:address_line1, :address_line2, :city, :zipcode])
    end
end
