class OffersController < ApplicationController
  def new
    @game = Game.find(params[:game_id])
  end

  private

  def article_params
    params.require(:offer).permit(photos: [])
  end
end
