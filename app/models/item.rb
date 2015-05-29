class Item
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid

  tags_separator ',' 

  field :title, type: String
  field :description, type: String
  as_enum :status, free: 1, used: 2, requested: 3

#  has_mongoid_attached_file :image, styles: {thumb: "100x100#"}, :default_url => "missing.png"
#  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  embeds_many :item_images, :cascade_callbacks => true
  accepts_nested_attributes_for :item_images, :allow_destroy => true


  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :status
  
  belongs_to :user
  
end
