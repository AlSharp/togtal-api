class PriceHistory
  include Mongoid::Document
  
  embedded_in :product
  
  field :date, type: Time
  field :price, type: Integer
  
  validates :date, :price, presence: true
end
