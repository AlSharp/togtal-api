module API::V1  
  class PriceHistoriesController < ApplicationController
    def index
      @price_histories = PriceHistory.all
      render json: @price_histories
    end
    
    def create
      @price_history = PriceHistory.new(price_history_params)
      
      @price_history.save
      render json: @price_history, status: :created
    end
    
    private
    
    def price_history_params
      params.require(:price_history).permit(:date, :price)
    end
  end
end
