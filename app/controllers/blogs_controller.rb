class BlogsController < ApplicationController
    before_action :set_blog, only: [:show, :edit, :update, :destroy] 
    before_action :login_check, only: [:new, :edit, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
  #省略
    if @blog.save
      redirect_to blogs_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @blog = Blog.find(params[:id])   # 重複！
  end

  def edit
    @blog = Blog.find(params[:id])   # 重複！
  end

  def update
    @blog = Blog.find(params[:id])   # 重複！
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
  @blog.destroy
  redirect_to blogs_path, notice:"ブログを削除しました！"
  end

  private
   def login_check
     user_signed_in?
     flash[:alert]="ログインしてください"
     redirect_to blogs_path
   end
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
end
