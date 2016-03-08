class Api::V1::ItemsController < ApplicationController
  # respond_to :json

  def index
    render json: Item.index_response
  end

  def show
    item = Item.where(id: params[:id]).index_response.first
    render json: item
  end
end
