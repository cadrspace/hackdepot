class Place
  include Mongoid::Document
  include SimpleEnum::Mongoid

  before_save :location_to_array

  field :title, type: String
  field :description, type: String
  field :status, type: String
  field :scope, type: String
  field :location, type: Array

  as_enum :status, active: 1, draft: 0

  index({ location: "2d" }, { min: -200, max: 200 })


  def location_to_array
    self.location = self.location.to_a
  end

  def unpack_location
    self.location
  end

  def pack_location
  end
end
