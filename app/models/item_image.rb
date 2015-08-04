class ItemImage
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  embedded_in :item, :inverse_of => :item_images

  has_mongoid_attached_file :image, styles: {thumb: "100x100#"}, :default_url => "missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  validates_attachment_size :image, :less_than => 5.megabytes
end
