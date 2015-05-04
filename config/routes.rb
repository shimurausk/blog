Rails.application.routes.draw do
  get 'contacts' => 'contacts#index'
  match 'contacts/confirm' ,:via => :post
  match 'contacts/create' ,:via => :post

  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations'
}
 

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

# Prefix Verb   URI Pattern                  Controller#Action
#                 root GET    /                                                 articles#index
#           dashborads GET    /dashborads(.:format)                             dashborads#index
#                      POST   /dashborads(.:format)                             dashborads#create
#        new_dashborad GET    /dashborads/new(.:format)                         dashborads#new
#       edit_dashborad GET    /dashborads/:id/edit(.:format)                    dashborads#edit
#            dashborad GET    /dashborads/:id(.:format)                         dashborads#show
#                      PATCH  /dashborads/:id(.:format)                         dashborads#update
#                      PUT    /dashborads/:id(.:format)                         dashborads#update
#                      DELETE /dashborads/:id(.:format)                         dashborads#destroy
#     article_comments GET    /articles/:article_id/comments(.:format)          comments#index
#                      POST   /articles/:article_id/comments(.:format)          comments#create
#  new_article_comment GET    /articles/:article_id/comments/new(.:format)      comments#new
# edit_article_comment GET    /articles/:article_id/comments/:id/edit(.:format) comments#edit
#      article_comment GET    /articles/:article_id/comments/:id(.:format)      comments#show
#                      PATCH  /articles/:article_id/comments/:id(.:format)      comments#update
#                      PUT    /articles/:article_id/comments/:id(.:format)      comments#update
#                      DELETE /articles/:article_id/comments/:id(.:format)      comments#destroy
#             articles GET    /articles(.:format)                               articles#index
#                      POST   /articles(.:format)                               articles#create
#          new_article GET    /articles/new(.:format)                           articles#new
#         edit_article GET    /articles/:id/edit(.:format)                      articles#edit
#              article GET    /articles/:id(.:format)                           articles#show
#                      PATCH  /articles/:id(.:format)                           articles#update
#                      PUT    /articles/:id(.:format)                           articles#update
#                      DELETE /articles/:id(.:format)                           articles#destroy

  # You can have the root of your site routed with "root"
   root 'articles#index'

   #get '*not_found' => 'application#routing_error'
   #post '*not_found' => 'application#routing_error'
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    #resources :dashborads
    resource :dashborads
    resources :articles do
      resources :comments
    end
  get 'articles/category/:category', to: 'articles#category', as: :category    
  get 'articles/tag/:tag' => 'articles#tag', as: :tag
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
     #match '*path' => redirect('/public/404.html')
end
