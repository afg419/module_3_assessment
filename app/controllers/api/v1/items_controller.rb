class Api::V1::ItemsController < ApplicationController
  # respond_to :json

  def index
    render json: Item.index_response
  end

  def show
    @item = Item.find(params[:id].to_i)
  end
end
