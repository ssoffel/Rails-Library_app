class BooksController < ApplicationController

  def index
    @books = Book.all
    #render json: @book
    render :index     #calls index.html.erb view and passes @books as the data
  end

  def show
    @book = Book.find_by(id: params[:id])
    if @book        #if book is no null
      render :show
    else
      redirect_to books_url    #books url is helper method
    end
  end

  def new
    @book = Book.new
    render :new
  end

  def create
    @book = Book.new(book_params)
    #whitewashing params
    #params = {book: {title: "Cat in Hat", author: "Steve Giroux"}}
    if @book.save #! would throw 400 exception if didn't save
      redirect_to book_url(@book)
    else
      render :new
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])  #find will throw error if not found, find_by will return nil
    render :edit
  end

  def update
    @book = Book.find_by(id: params[:id])
    if @book.update_attributes(book_params)
      redirect_to book_url(@book)
    else
      render :edit
    end

  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :year, :category, :description)
  end
end
