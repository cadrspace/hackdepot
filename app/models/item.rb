class Item
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  include Mongoid::Ancestry
  include MongoidMarkdown::Parser
  
  has_ancestry
  paginates_per 10
  tags_separator ','

  field :title, type: String
  markdown :description
  field :serial, type: String
  as_enum :status, free: 1, used: 2, requested: 3

  embeds_many :item_images, :cascade_callbacks => true
  accepts_nested_attributes_for :item_images, :allow_destroy => true

  embeds_many :item_fields, :cascade_callbacks => true
  accepts_nested_attributes_for :item_fields, :allow_desotry => true, :autosave => true, :reject_if => :all_blank

  validates_presence_of :title
  validates_presence_of :status

  belongs_to :user

  def self.search(query)
    where("$or" => [ { title:  /#{query}/ },
                     { id:     /#{query}/ },
                     { serial: /#{query}/ } ])
  end
end
