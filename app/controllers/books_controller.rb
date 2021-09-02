class BooksController < ApplicationController
  
  def show
    @book = Book.find(params[:id])
    @book_1 = Book.new
    # からのボックスにするために新しく定義する必要がある
    @user = @book.user
  end

  def index
    @books = Book.all
    @book = Book.new
    # @Bookの定義抜け、paramsは必要ない
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
      flash[:notice] = "You have created book successfully."
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      # 比較対象がある条件式に変更
      render :edit
      # アクションが同じ場合はrenderを使う
    else
      redirect_to books_path
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
      redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  
end
