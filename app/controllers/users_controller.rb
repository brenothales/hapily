class UsersController < ApplicationController
  def show
    @current_user = User.find(params[:user_id])
    @user_votes = Vote.where("user_id = ?", @current_user.id)
    @member_since = @current_user.created_at.strftime("%B %d, %Y")
  end
  
  def index
    @users = User.all
  end
end