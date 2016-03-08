class SearchController < ApplicationController
  def index
    bbs = BestBuyService.new    
      multi = true if params["search"].split.count > 1
    reply = bbs.search(params["search"].split.first)
    @best_buy_objects = BestBuyPresenter.new(reply)
  end
end
