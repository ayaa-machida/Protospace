Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'
  get "comments/:id/edit" => "comments#edit"
  post "comments/:id/update" => "comments#update"
    resources :prototypes do
    resources :comments, only: [:create, :destroy, :update, :edit]
  end
  resources :users, only: [:show, :update, :edit]
end


