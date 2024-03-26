class MessagesController < ApplicationController
  def show
    @offer = Offer.find(params[:id])
    @message = Message.new
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @message = Message.new(message_params)
    @message.offer = @offer
    @message.user = current_user
    if @message.save
      redirect_to offer_path(@offer)
    else
      render "offer/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
