class UsersController < ApplicationController
  
  def index # 一覧表示
    @users = User.all
  end
  
  def new # 新規登録
    @user = User.new
    
  end

  def create # DBに登録
    @user = User.new(params.require(:user).permit(:title, :startday, :finishday, :alltime, :memo))
    if @user.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :users
    else
      flash[:alert] = "スケジュールを登録できませんでした"
      render "new"
    end
    
  end

  def show # 確認
    @user = User.find(params[:id])
  end

  def edit # 編集
    @user = User.find(params[:id])
  end

  def update # 更新
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:title, :startday, :finishday, :alltime, :memo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :users
    else
      render "edit"
    end
  end

  def destroy #削除
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "スケジュールを削除しました"
    redirect_to :users
  end
  
end