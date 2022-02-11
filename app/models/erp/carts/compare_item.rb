module Erp::Carts
  class CompareItem < ApplicationRecord
    belongs_to :product, class_name: 'Erp::Products::Product'
    belongs_to :compare, class_name: 'Erp::Carts::Compare'
    
    def get_product_name
      product.present? ? product.get_short_name : ''
    end
    
    def self.get_all_items
      order('created_at DESC')
    end
    
    def self.get_comparision_hash(compare_items)
			hash = {}
			compare_items.get_all_items.each_with_index do |compare_item, index|
				compare_item.product.get_product_property_array.each do |property|
					hash[property[:name]] = [] if !hash[property[:name]].present?
					hash[property[:name]][index] = property[:values]
				end
			end
			hash
		end
  end
end