class Store
  include Mongoid::Document
  include Mongoid::Geospatial
  
  field :name, type: String
  
  field :location, type: Point, sphere: true
end
