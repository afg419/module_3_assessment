class Item < ActiveRecord::Base
  has_many :order_items
  has_many :orders, through: :order_items

  def self.index_response
    pluck(:name, :description, :image_url)
  end

  def show_response
    pluck(:name, :description, :image_url)    
  end
end
