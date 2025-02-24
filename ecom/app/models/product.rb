class Product < ApplicationRecord
    belongs_to :category
    belongs_to :brand
    has_many :cart_items, dependent: :destroy
    has_many :carts, through: :cart_items
    
    validates :name, :sku, :price, presence: true
    validates :sku, uniqueness: true
    validates :price, :saleprice, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
    validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
  