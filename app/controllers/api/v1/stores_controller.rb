module  Api::V1
  class StoresController < ApplicationController
    def index
      @parameters = params.slice(*Store.attribute_names)
      if (@parameters[:location])
        @parameters[:location][0] = @parameters[:location][0].to_f
        @parameters[:location][1] = @parameters[:location][1].to_f
      end
      @stores = Store.all(@parameters)
      render json: @stores
    end
    
    def filter
      northwest = [params[:north].to_f, params[:west].to_f]
      northeast = [params[:north].to_f, params[:east].to_f]
      southeast = [params[:south].to_f, params[:east].to_f]
      southwest = [params[:south].to_f, params[:west].to_f]
      polygon = [northwest, northeast, southeast, southwest, northwest]
      viewport = [polygon]
      @stores = Store.geo_spacial(:location.within_polygon => viewport)
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