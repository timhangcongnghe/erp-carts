module Erp::Carts
  class WishList < ApplicationRecord
    belongs_to :product, class_name: 'Erp::Products::Product'
    belongs_to :user, class_name: 'Erp::User'
  end
end