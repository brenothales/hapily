class UsersController < ApplicationController
  def show
    @current_user = User.find(params[:user_id])
    @member_since = @current_user.created_at.strftime("%B %d, %Y")
  end
  
  def index
    @users = User.page(params[:page]).per_page(10)
  end
end