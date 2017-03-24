Erp::Carts::Engine.routes.draw do
  namespace :frontend do
    resources :carts
    resources :cart_items do
      collection do
        get "add_to_cart"
      end    
    end
    resources :compares
    resources :compare_items do
      collection do
        get "add_to_compare"
      end    
    end    
  end
end