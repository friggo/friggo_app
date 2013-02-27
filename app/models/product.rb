class Product < ActiveRecord::Base
  attr_accessible :active, :description, :file, :name, :price, :quantity_to_sell, :visible 
  belongs_to :user
  
  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :name, length: { maximum: 50 }
  validates :description, length: { maximum: 2000 }
  validates :price, presence: true, gte: 0
  validates :quantity_to_sell, presence: true, gte: 0

  # Order the products in a desc order
  default_scope order: 'products.created_at DESC'
end
