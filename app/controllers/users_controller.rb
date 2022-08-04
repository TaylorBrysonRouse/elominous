class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    puts current_user.customer
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
