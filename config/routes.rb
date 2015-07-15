Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'
  resources :users
  resources :admins
  resources :categories
  resources :posts do
    collection do
      get 'post_search'
    end
  end
  resources :archives do
    collection do
      get 'previous_record'
    end
  end
  resources :galleries do
    resources :photos
  end
  resources :videos
  resources :headlines do
    collection do
      get 'post_search_for_headline'
    end
  end
  resources :special_news
  resources :slider_news
  resources :breaking_news
  resources :news do
    collection do
      get "category_news/:id", action: 'category_news', as: :category_news
      get "video_gallery/:id", action: 'video_gallery', as: :video_gallery
      get "photo_gallery/:id", action: 'photo_gallery', as: :photo_gallery
      get "division/:id", action: 'division', as: :division
      get "archive"
      get "previous_record"
    end
  end
  resources :left_category_news
  resources :right_category_news
  resources :bottom_category_news
  resources :newsproperties

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
