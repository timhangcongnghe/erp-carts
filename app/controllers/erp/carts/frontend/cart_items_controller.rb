module Erp
  module Carts
    module Frontend
      class CartItemsController < Erp::Frontend::FrontendController
        before_action :set_cart_item, only: [:show, :edit, :update, :destroy]
    
        # POST /cart_items
        # POST /cart_items.json
        def create
          product = Erp::Products::Product.find(params[:product_id])
          @cart_item = @cart.add_product(product.id)
      
          if @cart_item.save
            redirect_to erp_online_store.root_path
          end
        end
        
        # POST /cart_items
        # POST /cart_items.json
        def add_to_cart
          product = Erp::Products::Product.find(params[:product_id])
          @cart_item = @cart.add_product(product.id)
          @cart_item.menu_id = params[:menu_id] if params[:menu_id].present?
      
          if @cart_item.save
            redirect_to erp_online_store.root_path
          end
        end
      
        # PATCH/PUT /cart_items/1
        # PATCH/PUT /cart_items/1.json
        def update
          if @cart_item.update(cart_item_params)
            redirect_to erp_online_store.root_path
          end
        end
      
        # DELETE /cart_items/1
        # DELETE /cart_items/1.json
        def destroy
          @cart_item.destroy
          redirect_to erp_online_store.root_path
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_cart_item
            @cart_item = CartItem.find(params[:id])
          end
      
          # Never trust parameters from the scary internet, only allow the white list through.
          def cart_item_params
            params.require(:cart_item).permit(:product_id)
          end
      end
    end
  end
end