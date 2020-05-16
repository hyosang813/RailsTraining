# RailsTutorial用だからAPI用とは違うけど同じ名前
class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
       flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # 成功したらユーザページへ
    else
      render 'new' # 失敗したらnewアクションをレンダリング
    end
  end

  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end
end
