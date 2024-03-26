class OffersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @user = User.find(params[:user_id])
  end

  def show
    @offer = Offer.find(params[:id])
    @game = @offer.game
  end

  def new
    @game = Game.find(params[:game_id])
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.game = Game.find(params[:game_id])

    if @offer.save
      flash[:notice] = "Jeu ajouté !"
      redirect_to offer_path(@offer)
    else
      flash[:alert] = "Une erreur est survenue."
      # render :new
      redirect_to new_game_offer_path(game: @game)
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    @offer.update(offer_params)
    if @offer.save
      redirect_to offer_path(@offer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to offers_path(user_id: current_user), status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(
      :box_condition,
      :cover_condition,
      :manual_condition,
      :media_condition,
      :price,
      :on_sale,
      :description,
      photos: []
    )
  end
end
