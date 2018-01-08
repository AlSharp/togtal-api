class Product
  include Mongoid::Document
  include Mongoid::Geospatial
  
  belongs_to :store
  embeds_many :price_histories
  
  accepts_nested_attributes_for :price_histories
  
  field :name, type: String
  field :weight, type: Integer
  field :currentprice, type: Integer
  field :location, type: Point, sphere: true
  
  validates :name, :weight, :currentprice, :location, presence: true
  
end
