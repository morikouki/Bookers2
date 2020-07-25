class UsersController < ApplicationController
	before_action :authenticate_user!

  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
