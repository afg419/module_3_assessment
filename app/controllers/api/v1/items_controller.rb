class Api::V1::ItemsController < ApplicationController
  respond_to :json

  def index
    render json: Item.index_response
  end

  def show
    item = Item.where(id: params[:id]).index_response.first
    render json: item
  end

  def destroy
    item = Item.find_by(id: params[:id])
    if item
      item.destroy
      response.status = 204
      render json: ({reply: "Item was deleted"})
    else
      response.status = 400
      render json: ({reply: "Item did not exist in database"})
    end
  end

  def create
    item = Item.new(item_params)
    if item.save
      response.status = 201
      render json: [item.name, item.description, item.image_url]
    else
      response.status = 400
      render json: ({reply: "Item was not created"})
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
