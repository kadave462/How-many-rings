class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  def index
    @query = params[:query]
    if @query.blank?
      @games = Game.all
    else
      @games = Game.where('title ILIKE ?', "%#{@query}%")
    end
  end

  def show
    @offers = @game.offers
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
