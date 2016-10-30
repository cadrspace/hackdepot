class ItemField
  include Mongoid::Document

  field :name
  field :value

  embedded_in :item, :inverse_of => :item_fields
  belongs_to :item
end

