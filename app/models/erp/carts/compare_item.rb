module Erp::Carts
  class CompareItem < ApplicationRecord
    belongs_to :product, class_name: "Erp::Products::Product"
    belongs_to :compare
    
    def self.get_all_items
      self.order("created_at DESC")
    end
  end
end
