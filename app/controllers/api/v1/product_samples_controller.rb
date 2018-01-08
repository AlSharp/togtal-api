module Api::V1  
  class ProductSamplesController < ApplicationController
    def index
      @product_samples = ProductSample.all
    end
    
    def create
      @product_sample = ProductSample.new(product_sample_params)
      @product_sample.save
    end
    
    private
    
    def product_sample_params
      params.require(:product_sample).permit(:name, :weight)
    end
  end
end