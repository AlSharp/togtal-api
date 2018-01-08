module Api::V1  
  class ProductsController < ApplicationController
    def index
      @products = Product.all
      render json: @products
    end
    
    def create
      @product = Product.new(product_params)
      
      @product.save
      render json: @product, status: :created
    end
    
    private
    
    def product_params
      params.require(:product).permit(:name, :weight, :currentprice, :location => {}, :price_histories_attributes => [:date, :price])
    end
  end
end
