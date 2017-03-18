module Erp::Carts
  class CartItem < ApplicationRecord
    belongs_to :product, class_name: "Erp::Products::Product"
    belongs_to :cart
    
    def total_price
      product.price*quantity
    end
    
    def self.number_items
      count = 0
      self.all.each do |item|
        count += item.quantity
      end
      
      return count
    end 
    
  end
end
