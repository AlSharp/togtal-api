Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :stores do
        resources :products
        collection do
          get 'filter'
        end
      end 
      resources :product_samples, :products
    end
  end
end