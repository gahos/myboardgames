class GamesController < ApplicationController
  before_action :require_user_logged_in
  before_action :require_correct_user,only: [:show, :edit, :update, :destroy]
  before_action :set_game,only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.build(game_params)
    
    if @game.save
      flash[:success] = 'ゲーム情報が正常に登録されました'
      redirect_to user_url(current_user)
    else
      flash.now[:danger] = 'ゲーム情報は登録されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if @game.update(game_params)
      flash[:success] = 'ゲーム情報は正常に更新されました'
      redirect_to @game
    else
      flash.now[:danger] = 'ゲーム情報は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @game.destroy

    flash[:success] = 'ゲーム情報は正常に削除されました'
    redirect_to user_url(current_user)
  end
  
  private
  
  def set_game
    @game = Game.find(params[:id])
  end
  
  def game_params
    params.require(:game).permit(:title,:having,:rating)
  end

  private
  
  def correct_user?
    !!current_user.games.find_by(id: params[:id])
  end

end
