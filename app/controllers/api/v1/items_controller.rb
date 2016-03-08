class Api::V1::ItemsController < ApplicationController
  # respond_to :json

  def index
    # respond_with ({"hey" => "x"})
    render json: ({"hey" => "x"})
  end

  def show
    @item = Item.find(params[:id].to_i)
  end
end
