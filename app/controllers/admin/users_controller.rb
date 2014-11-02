class Admin::UsersController < Admin::BaseController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    passwd = params[:user][:password]
    usr_params = user_params.merge(password_confirmation: passwd)

    @user = User.new(usr_params)
    if @user.save
      flash[:success] = 'User has been created.'
      redirect_to [:admin, @user]
    else
      flash.now[:danger] = 'User has not been created.'
      render :new
    end
  end

  def edit
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
    end

    if @user.update(user_params)
      flash[:success] = 'User has been updated.'
      redirect_to [:admin, @user]
    else
      flash[:danger] = 'User has not been updated.'
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = 'User has been deleted.'
      redirect_to admin_users_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end
end
