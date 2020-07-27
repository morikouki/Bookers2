class UsersController < ApplicationController

	before_action :authenticate_user!

  def index
  	@users = User.all
    @user = User.find(current_user.id)
    @book = Book.new
  end

  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id == current_user.id
      render 'edit'
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
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
