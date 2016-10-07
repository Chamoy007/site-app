Rails.application.routes.draw do

  resources :companies
  resources :sectors
  devise_for :users
  resources :categories

  resources :surveys do
    resources :questions, except: :show
    resources :replies, except: :destroy
  end

  get '/questions/:question_id/possible_answers', to: 'possible_answers#index', as: 'question_possible_answers'
  post '/questions/:question_id/possible_answers', to: 'possible_answers#create'
  get '/questions/:question_id/possible_answers/new', to: 'possible_answers#new', as: 'new_question_possible_answer'
  get '/questions/:question_id/possible_answers/:id/edit', to: 'possible_answers#edit', as: 'edit_question_possible_answer'
  patch '/questions/:question_id/possible_answers/:id', to: 'possible_answers#update', as: 'question_possible_answer'
  delete '/questions/:question_id/possible_answers/:id', to: 'possible_answers#destroy'
  post "/deactivate", to: "companies#deactivate"
  post "/action_activate", to: "companies#action_activate"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'home#index'

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
