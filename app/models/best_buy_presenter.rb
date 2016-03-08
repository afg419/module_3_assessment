class BestBuyPresenter
  attr_reader :data

  def initialize(reply)
    @data = reply
  end

  def products
    @data["products"].map{|product_data| create_product(product_data)}
  end

  def create_product(product)
    OpenStruct.new(product)
  end
end
