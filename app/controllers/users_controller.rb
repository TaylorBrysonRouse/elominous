class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_variables
  
  def index
    puts current_user.customer
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  protected

  def set_user_variables
    @customer = current_user.customer
  end
end
