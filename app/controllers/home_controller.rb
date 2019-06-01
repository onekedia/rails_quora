class HomeController < ApplicationController
  def index
  	@user = User.new
  end

  def profile
    @user = current_user
  end

  def user
    @user = User.find(params[:id])
    @current_user = current_user
    @followings = Relationship.includes(:user).where(follower_id: @user.id)
  end

end
