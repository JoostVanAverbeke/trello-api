class CardsController < ApplicationController
  before_action :set_card, only: [ :show, :move ]
  def index
    @cards = CardsDatatable.new(params)
    render json: @cards
  end

  def show
    json_response @card
  end

  def move
    to_lane = Lane.find(card_params[:to])
    if @card.matchesBoard?(to_lane)
      @card.lane = to_lane
      @card.save
      json_response @card, :created
    else
      json_response 'Validation failed: Lane id in the to param is not valid',:unprocessable_entity
    end
  end

  private
  
  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    # whitelist params
    params.permit(:to)
  end
end
