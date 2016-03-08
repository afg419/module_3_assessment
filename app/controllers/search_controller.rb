class SearchController < ApplicationController
  def index
    bbs = BestBuyService.new
    reply = JSON.parse(bbs.search(params["search"]))
    binding.pry
  end
end
