Rails.application.routes.draw do
  resources :money_uages

  resources :banks

  resources :raw_materials

  resources :line_charts
  get 'my_linecharts' => "line_charts#my_linecharts"

  resources :purchase_histories
  get 'purchase_report' => 'purchase_histories#purchase_report'
  get 'add_new_purchase' => 'purchase_histories#add_new_purchase'
  get 'today_purchase' => 'purchase_histories#today_purchase'
  get 'get_phone' => 'purchase_histories#get_phone', :as => :get_phone
  get 'get_item' => 'purchase_histories#get_item', :as => :get_item
  get 'get_item_name' => 'purchase_histories#get_item_name', :as => :get_item_name
  get 'get_debit' => 'purchase_histories#get_debit', :as => :get_debit
  post 'reduce_debit' => 'purchase_histories#reduce_debit', :as => :reduce_debit
  get 'my_supplier' => 'purchase_histories#my_supplier'


  resources :suppliers

  resources :invoices
  get 'sale_history' => 'invoices#sale_history'
  get 'sale_invoice' => 'invoices#sale_invoice'
  get 'sale_report' => 'invoices#sale_report'
  get 'today_sale' => 'invoices#today_sale'
  
  resources :customers
  get 'customer_new'  => 'customers#customer_new'
  
  resources :phone_books

  resources :sales
  get 'sale_force' => 'sales#sale_force'
  get 'sale_force_by_type' => 'sales#sale_force_by_type'
  get 'sale_force_by_brand' => 'sales#sale_force_by_brand'
  put 'check/:id' => 'sales#check', :as => :check
  put 'uncheck/:id' => 'sales#uncheck', :as => :uncheck
  put 'check_in_stock/:id' => 'sales#check_in_stock', :as => :check_in_stock
  put 'readd_in_stock/:id' => 'sales#readd_in_stock', :as => :readd_in_stock
  get 'invoice_print' => 'sales#invoice_print'
 

  resources :types

  resources :brands

  resources :stocks
  get 'get_data'  => 'stocks#get_data'
  get 'find_stock' => 'stocks#find_stock'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'phone_books#dashboard'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
