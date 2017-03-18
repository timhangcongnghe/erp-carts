module Erp
  module Carts
    module Frontend
      class CartsController < Erp::Frontend::FrontendController
        before_action :set_cart, only: [:show, :edit, :update, :destroy]
        rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
        
        # GET /carts
        # GET /carts.json
        def index
          @cart.remove_cart_item(params[:cart_item_id]) if params[:do] == "remove_cart_item"
        end
      
        # POST /carts
        # POST /carts.json
        def create
          @cart = Erp::Carts::Cart.new(cart_params)
          if @cart.save
            redirect_to erp_online_store.root_path
          end
        end
      
        # PATCH/PUT /carts/1
        # PATCH/PUT /carts/1.json
        def update
          params.to_unsafe_h[:quantities].each do |q|
            li = Erp::Carts::CartItem.find(q[0])
            li.update_attribute(:quantity, q[1])
          end
          
          redirect_to erp_online_store.root_path
        end
      
        # DELETE /carts/1
        # DELETE /carts/1.json
        def destroy
          @cart.destroy
          redirect_to erp_online_store.root_path
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_cart
            @cart = Erp::Carts::Cart.find(params[:id])
          end
      
          # Never trust parameters from the scary internet, only allow the white list through.
          def cart_params
            params.fetch(:cart, {})
          end
          
          def invalid_cart
            logger.error "Attempt to access invalid cart #{params[:id]}"
            redirect_to erp_online_store.root_path, notice: 'Invalid cart'
          end
      end
    end 
  end
end