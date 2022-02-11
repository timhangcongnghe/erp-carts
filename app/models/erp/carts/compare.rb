module Erp::Carts
  class Compare < ApplicationRecord
    has_many :compare_items, class_name: 'Erp::Carts::CompareItem', dependent: :destroy      
    
    def get_number_items
      compare_items.count
    end
    
    def remove_compare_item(compare_item_id)
      compare_items.where(id: compare_item_id).destroy_all
    end
  end
end