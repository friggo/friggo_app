class Product < ActiveRecord::Base
  attr_accessible :active, :description, :file, :name, :price, :quantity_to_sell, :visible , :category_id, :photo
  belongs_to :user
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, length: { maximum: 50 }
  validates :description, length: { maximum: 2000 }
  validates :price, presence: true
  validates :quantity_to_sell, presence: true

  has_attached_file :photo ,
                            :url => "/assets/:class/:id/:attachment/:style.:extension",
                            :path => ":rails_root/public/assets/:class/:id/:attachment/:style.:extension"
  # Order the products in a desc order
  default_scope order: 'products.created_at DESC'
end
