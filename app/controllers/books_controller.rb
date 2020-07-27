class BooksController < ApplicationController
	
	before_action :authenticate_user!

  def index
  	@book = Book.new
  	@books = Book.all
    @user = User.find(current_user.id)
  end

  def create
  	@book = Book.new(book_params)
  	@book.user_id = current_user.id
  	if @book.save
       flash[:save] = "You have creatad book successfully."
  	   redirect_to book_path(@book)
    else
      @books = Book.all
      @user = User.find(current_user.id)
      render 'index'
    end
  end

  def show
    @bookk = Book.find(params[:id])
    @user = @bookk.user
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render 'edit'
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:update] = "You have updated book successfully."
       redirect_to book_path(@book.id)
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body, :user_id)
  end

end
