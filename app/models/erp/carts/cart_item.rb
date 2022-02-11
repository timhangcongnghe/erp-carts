module Erp::Carts
  class CartItem < ApplicationRecord
    belongs_to :product, class_name: 'Erp::Products::Product'
    belongs_to :cart, class_name: 'Erp::Carts::Cart'
    
    def get_product_name
      product.present? ? product.get_short_name : ''
    end

    def get_product_warranty
      product.present? ? product.get_warranty : ''
    end
    
    def get_product_price
      product.present? ? product.get_show_price : ''
    end
    
    def total_price
      get_product_price*quantity
    end
    
    def self.number_items
      return sum(:quantity)
    end 
  end
end