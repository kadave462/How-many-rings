class OffersController < ApplicationController

  private

  def article_params
    params.require(:offer).permit(photos: [])
  end

end
