require 'spec_helper'
require 'rails_helper'
#
# RSpec.describe BestBuyService, type: :model do
#
#   VCR.use_casette "bbs-basic" do
#     it "makes request to best buy" do
#         bbs = BestBuyService.new
#         reply = bbs.search("boot")
#         binding.pry
#     end
#   end
#
# end

RSpec.feature "BestBuy service does its thing", type: :feature do
  scenario "A user submit search queries to BestBuy" do
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
end
