class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :require_correct_user, only: [:show]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ようこそ！'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  private
  
  def correct_user?
    return (current_user.id == params[:id].to_i)
  end
end
