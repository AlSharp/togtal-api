module  Api:: V1
  class StoresController < ApplicationController
    def index
      @stores = Store.all
      render json: @stores
    end
    
    def create
      @store = Store.new(store_params)
      
      @store.save
      render json: @store, status: :created
    end
    
    private
    
    def store_params
      params.require(:store).permit(:name, :location => {})
    end
  end
end