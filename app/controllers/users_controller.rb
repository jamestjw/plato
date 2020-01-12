class UsersController < ApplicationController
  before_action :authenticate_admin!

  skip_before_action :authenticate_user!
  before_action :authenticate_user!, unless: :admin_signed_in?

  def index
    @users = User.all
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: 'User deleted.'
  end  
end
