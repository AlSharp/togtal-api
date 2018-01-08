class Store
  include Mongoid::Document
  include Mongoid::Geospatial
  
  has_many :products
  
  field :name, type: String
  field :location, type: Point, sphere: true
  
  validates :name, :location, presence: true
end
