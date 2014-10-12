class PublishersController < ApplicationController
  before_action :set_publisher, except: [:index, :new, :create]

  def index
    @publishers = Publisher.all
  end

  def show
  end

  def new
    @publisher = Publisher.new
#    require 'pry'; binding.pry
  end

  def create
    @publisher = Publisher.new(publisher_params)
    if @publisher.save
      flash[:success] = 'Publisher has been created.'
      redirect_to @publisher
    else
      flash[:danger] = 'Publisher has not been created.'
      render :new
    end
  end

  def edit
  end

  def update
    if @publisher.update(publisher_params)
      flash[:success] = 'Publisher has been updated.'
      redirect_to @publisher
    else
      flash[:danger] = 'Publisher has not been updated.'
      render :edit
    end
  end

  def destroy
    if @publisher.destroy
      flash[:success] = 'Publisher has been deleted.'
      redirect_to publishers_path
    end
  end

  private
    def publisher_params
      params.require(:publisher).permit(:name)
    end

    def set_publisher
      @publisher = Publisher.find(params[:id])
    end
end
