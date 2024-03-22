class OffersController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
    @game = @offer.game
  end

  def new
    @game = Game.find(params[:game_id])
    @offer = Offer.new
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
      render :new, status: :unprocessable_entity
    end
  end


  def create
    @offer = Offer.new(offer_params)
    @offer.user = current_user
    @offer.game = Game.find(params[:game_id])
    @offer.on_sale = true
    @offer.description = 'Petit test amical'

    if @offer.save
      flash[:notice] = "bravo"
      redirect_to "/"
    else
      redirect_to new_game_offer_path(game: @game)
      flash[:alert] = "erreur"
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy
    redirect_to game_path(@offer.game), status: :see_other
  end

  private

  def offer_params
    params.require(:offer).permit(
      :box_condition,
      :cover_condition,
      :manual_condition,
      :media_condition,
      photos: []
    )
  end
end
