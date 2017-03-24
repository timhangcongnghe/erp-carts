module Erp
  module Carts
    module Frontend
      class CompareItemsController < Erp::Frontend::FrontendController

        # POST /cart_items
        # POST /cart_items.json
        def add_to_compare
          exist = Erp::Carts::CompareItem.where(product_id: params[:product_id]).where(compare_id: @compare.id)
          
          if exist.count == 0
            product = Erp::Products::Product.find(params[:product_id])
            @compare_item = @compare.compare_items.build(product: product)
            @compare_item.menu_id = params[:menu_id] if params[:menu_id].present?
        
            if @compare_item.save
              redirect_to erp_online_store.root_path
            end
          else
            redirect_to erp_online_store.root_path
          end
        end
    
        private
          # Only allow a trusted parameter "white list" through.
          def compare_line_params
            params.fetch(:compare_line, {}).permit(:product_id, :menu_id)
          end
      end
    end
  end
end
