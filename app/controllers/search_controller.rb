class SearchController < ApplicationController
  def index
    bbs = BestBuyService.new
    reply = bbs.search(params["search"])
    @best_buy_objects = BestBuyPresenter.new(reply)
  end
end
