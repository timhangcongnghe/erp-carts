module Erp
  module Carts
    module Frontend
      class ComparesController <Erp::Frontend::FrontendController
        before_action :set_compare, only: [:destroy]
      
        # GET /compares
        def index
          @compare.remove_compare_item(params[:compare_item_id]) if params[:do] == "remove_compare_item"
        end
      
        # POST /compares
        def create
          @compare = Erp::Carts::Compare.new(compare_params)
          if @compare.save
            redirect_to erp_online_store.root_path
          end
        end
      
        # DELETE /compares/1
        def destroy
          @compare.destroy
          redirect_to erp_online_store.root_path
        end
      
        private
          # Use callbacks to share common setup or constraints between actions.
          def set_compare
            @compare = Compare.find(params[:id])
          end
      
          # Only allow a trusted parameter "white list" through.
          def compare_params
            params.fetch(:compare, {})
          end
      end
    end
  end
end
