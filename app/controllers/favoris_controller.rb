class FavorisController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @user = current_user
    @favori = Favori.new
    @favori.game_id = @game.id
    @favori.user_id = current_user.id
    @favori.save

    respond_to do |format|
      format.html { redirect_to games_path }
      format.text { render partial: 'games/game', locals: { game: @game }, formats: [:html] }
    end
  end

  def destroy
    @favori = Favori.find(params[:id])
    @game = @favori.game
    @favori.destroy

    respond_to do |format|
      format.html { redirect_to games_path }
      format.text { render partial: 'games/game', locals: { game: @game }, formats: [:html] }
    end
  end

  def index
    @favoris = Favori.where(user_id: current_user.id)
  end
end
