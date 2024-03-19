class GamesController < ApplicationController
  def index
    @games = Game.all
    @offers = Offer.all
  end
end
