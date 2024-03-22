class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_game, only: [:show]

  def index
    @query = params[:query]
    if @query.blank?
      @games = Game.all.order(created_at: :desc)
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
