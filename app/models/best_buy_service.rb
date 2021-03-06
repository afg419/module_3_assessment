class BestBuyService

  attr_reader :key, :base_url

  def initialize
    @key = "apiKey=#{ENV["BEST_BUY_KEY"]}"
    @base_url = "https://api.bestbuy.com/v1/products"
  end

  def get(path, params = "")
    params = "&" + params if !params.empty?
    path = "(#{path})" if !path.empty?

    uri = URI("#{base_url}#{path}?#{key}#{params}")
    req = Net::HTTP::Get.new(uri)
    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") {|http|
      http.request(req)
    }
    res.body
  end

  def search(search_value)
    JSON.parse(get("search=#{search_value}","format=json&show=sku,name,salePrice,shortDescription,image,customerReviewAverage&pageSize=15"))
  end

  def multi_search(search_term_array)
    search_term_array.map!{|x| "#{x}*"}
    search_value = search_term_array.join("&longDescription=").prepend("longDescription=")
    JSON.parse(get("#{search_value}","format=json&show=longDescription,sku,name,salePrice,shortDescription,image,customerReviewAverage&pageSize=15"))
  end
end

# 'https://api.bestbuy.com/v1/products(longDescription=iPhone*|sku=7619002)?show=sku,name&pageSize=15&page=5&apiKey=YourAPIKey&format=json'

  # products(search=sennheiser)
  # url + search=sennheiser + "format=json&show=sku,name,salePrice,image"

  # "https://api.bestbuy.com/v1/products(search=oven&search=stainless&search=steel)?format=json&show=sku,name,salePrice&apiKey=YourAPIKey"
  # get("products/8880044.json", "show=sku,name,salePrice")
  # "https://api.bestbuy.com/v1/products/8880044.json?show=sku,name,salePrice&apiKey=YourAPIKeyend"
# req.body = "grant_type=authorization_code&code=#{code}&redirect_uri=http://localhost:3000/reddit/auth"

#AND SEARCH # 'https://api.bestbuy.com/v1/products(manufacturer=canon&salePrice<1000)?format=json&show=sku,name,salePrice&apiKey=YourAPIKey'
