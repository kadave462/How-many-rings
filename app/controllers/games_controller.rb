class GamesController < ApplicationController
  before_action :set_game, only: [:show]
  # before_action :set_game, only: [:show, :edit, :update, :destroy](change this line later)

  def show
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
