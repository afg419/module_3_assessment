class SearchController < ApplicationController
  def index
    bbs = BestBuyService.new
    if params["search"].strip.include?(" ")
      reply = bbs.multi_search(params["search"].split)
    else
      reply = bbs.search(params["search"])
    end
    @best_buy_objects = BestBuyPresenter.new(reply)
  end
end
