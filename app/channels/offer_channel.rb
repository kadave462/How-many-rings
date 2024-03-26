class OfferChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    offer = Offer.find(params[:id])
    stream_for offer
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed

  end
end
