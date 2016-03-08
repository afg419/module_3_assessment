RSpec.feature "BestBuy service does its thing", type: :feature do
  scenario "BestBuyService Basics" do
    VCR.use_cassette 'bbs-basic' do
      bbs = BestBuyService.new
      reply = bbs.search("boot")
      expect(reply.except("products")).to eq ({"from"=>1,
                                               "to"=>15,
                                               "total"=>828,
                                               "currentPage"=>1,
                                               "totalPages"=>56,
                                               "queryTime"=>"0.005",
                                               "totalTime"=>"0.048",
                                               "partial"=>false,
                                               "canonicalUrl"=>
                                               "/v1/products(search=\"boot\")?show=sku,name,salePrice,shortDescription,image,customerReviewAverage&format=json&apiKey=m7sfn4nqtmg8u96aakbfz49e"})
    end
  end

  scenario "BestBuyService Multis" do
    VCR.use_cassette 'bbs-multi' do
      bbs = BestBuyService.new
      reply = bbs.multi_search(["boot","brown"])
      expect(reply.except("products")).to eq ({"from"=>1,
                                               "to"=>2,
                                               "total"=>2,
                                               "currentPage"=>1,
                                               "totalPages"=>1,
                                               "queryTime"=>"0.021",
                                               "totalTime"=>"0.029",
                                               "partial"=>false,
                                               "canonicalUrl"=>
                                                "/v1/products(longDescription=\"boot*\"&longDescription=\"brown*\")?show=longDescription,sku,name,salePrice,shortDescription,image,customerReviewAverage&format=json&apiKey=m7sfn4nqtmg8u96aakbfz49e"})
    end
  end
end
