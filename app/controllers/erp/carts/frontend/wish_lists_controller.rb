module Erp
  module Carts
    module Frontend
      class WishListsController < Erp::Frontend::FrontendController

        # POST /wish_lists
        # POST /wish_lists.json
        def add_to_wish_list
          exist = Erp::Carts::WishList.where(product_id: params[:product_id]).where(user_id: current_user.id)
          
          if exist.count == 0
            @wish_list = WishList.new(
              product_id: params[:product_id],
              user_id: current_user.id
            )
            if @wish_list.save
              redirect_to erp_online_store.root_path
            end
          else
            redirect_to erp_online_store.root_path
          end
        end
        
      end
    end
  end
end