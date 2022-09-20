Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "posts#index"

  resources :posts do

    resource :comments

    #get 'comments', to: 'comments#new', as: 'comments_new'
    #get 'comments/:id', to: 'comments#destroy', as: 'comments_destroy'
    #get 'comments/:id', to: 'comments#edit', as: 'comments_edit' 
  end
  resources :users

end
