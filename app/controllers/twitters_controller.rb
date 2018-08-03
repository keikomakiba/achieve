class TwittersController < ApplicationController
    before_action :set_twitter, only: [:show, :edit, :update, :destroy] 
    before_action :log_in?, only: [:new, :edit, :show, :destroy] 
    
    
  def index
    @twitters = Twitter.all
  end
  
  def top
    @twitters = Twitter.all
  end

  def new
    if params[:back]
      @twitter = Twitter.new(twitter_params)
    else
      @twitter = Twitter.new
    end
  end
  
  def confirm
    @twitter = Twitter.new(twitter_params)
    @twitter.user_id = current_user.id
    render :new if @twitter.invalid?
  end
  

  def create
    @twitter = Twitter.new(twitter_params)
    @twitter.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
    if @twitter.save
      redirect_to twitters_path, notice: "ブログを作成しました！"
    else
      render 'new'
    end
  end

  def show
    @twitter = Twitter.find(params[:id])   # 重複！
    # @favorite = current_user.favorites.find_by(twitter_id: @twitter.id)
    @favorite = current_user.favorites.find_by(twitter_id: @twitter.id)
  end

  def edit
    @twitter = Twitter.find(params[:id])   # 重複！
  end

  def update
    @twitter = Twitter.find(params[:id])   # 重複！
    if @twitter.update(twitter_params)
      redirect_to twitters_path, notice: "ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy
  @twitter.destroy
  redirect_to twitters_path, notice:"ブログを削除しました！"
  end

  private
  
  def set_twitter
  @twitter = Twitter.find(params[:id])
  end

  def twitter_params
    params.require(:twitter).permit(:content)
  end
  
  def log_in?
    if current_user.blank?
      redirect_to new_session_path
    end

  end
end
