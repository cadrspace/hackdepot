class Item
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Ancestry
  has_ancestry
  paginates_per 10
  tags_separator ','

  field :title, type: String
  field :description, type: String
  field :serial, type: String
  as_enum :status, free: 1, used: 2, requested: 3

#  has_mongoid_attached_file :image, styles: {thumb: "100x100#"}, :default_url => "missing.png"
#  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  embeds_many :item_images, :cascade_callbacks => true
  accepts_nested_attributes_for :item_images, :allow_destroy => true

#  has_many :item_fields, :autosave => true
  embeds_many :item_fields, :cascade_callbacks => true
  accepts_nested_attributes_for :item_fields, :allow_desotry => true, :autosave => true, :reject_if => :all_blank

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :status

  belongs_to :user

  #  scope :search, ->(query) { where("title LIKE ?", "#{query}%") }

  def self.search(query)
    where(title: /#{query}/)
  end

  # has_many :children,
  #   class_name: 'Item',
  #   inverse_of: :parent
  # belongs_to :parent,
  #   class_name: 'Item',
  #   inverse_of: :children
end
