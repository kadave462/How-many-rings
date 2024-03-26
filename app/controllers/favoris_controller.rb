class FavorisController < ApplicationController
  def create
    @favori = Favori.new
    @game = Game.find(params[:game_id])
    @user = current_user
    @favori.game_id = @game.id
    @favori.user_id = current_user.id
    if @favori.save
      flash[:notice] = "ajouté dans les favoris!"
    else
      flash[:alert] = "Une erreur est survenue."
    end
    redirect_to game_path(@game)
  end

  def destroy
    @favori = Favori.find(params[:id])
     @game = Game.find(params[:game_id])
    if @favori.destroy
      flash[:notice] = "retiré des favoris!"
    else
      flash[:alert] = "Une erreur est survenue."
    end
    redirect_to game_path(@game)
  end

  def index
    @favoris = Favori.where(user_id: current_user.id)
  end
end
