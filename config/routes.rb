# -*- coding: utf-8 -*-
Cromos::Application.routes.draw do

  get "menu/index"
  match "menu/", :to => "menu#index"
  match "menu/interviews/:type", :to => "menu#interviews"
  match "menu/interviews_to_result", :to => "menu#interviews_to_result"

  resources :diagnoses do
    collection do
      get 'relation'
      get 'search_interview'
      post 'search_interview_start'
      post 'add_relation'
      post 'delete_relation'
    end
  end

  devise_for :users

  get "welcome/index"

  get 'interviews', :to => 'interviews#index', :as => :user_root
  resources :interviews do
    collection do
      get 'relation'
      get 'search_diagnosis'
#      post 'search_diagnosis_start'
      post 'ajax_search_diagnosis_start'
      post 'add_relation'
      post 'delete_relation'
      get 'settings'
    end
  end

#  root :to => "welcome#index"
  root :to => "menu#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
