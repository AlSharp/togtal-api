class Store
  include Mongoid::Document
  include Mongoid::Geospatial
  
  field :name, type: String
  
  field :location, type: Point, sphere: true
  
  validates :location, presence: true
end
