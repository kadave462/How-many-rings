class GamesController < ApplicationController
  def index
    @games = Game.all
    @offers = Offer.all
  end

  before_action :set_game, only: [:show]
  # before_action :set_game, only: [:show, :edit, :update, :destroy](change this line later)

  def show
    @offers = @game.offers
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
