class Admin::BaseController < ApplicationController
  before_action :require_signin
  before_action :require_admin

  def index
  end
end
