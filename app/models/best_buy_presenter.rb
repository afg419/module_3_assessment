class BestBuyPresenter
  attr_reader :data

  def initialize(reply)
    @data = reply
  end

  def products
    if @data["products"].empty?
      return [create_product({name: "Sorry, your search returned no results!"})]
    end
    @data["products"].map{|product_data| create_product(product_data)}
  end

  def create_product(product)
    OpenStruct.new(product)
  end
end
