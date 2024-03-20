class OffersController < ApplicationController

  def show
  end

  def new
    @game = Game.find(params[:game_id])
    @offer = Offer.new
  end

  private

  def article_params
    params.require(:offer).permit(photos: [])
  end
end
