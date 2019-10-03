class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		redirect_to posts_path
  	else
  		render :new
  	end
  end

  def index
  end

  private
  def user_params
  	params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
  end
end
