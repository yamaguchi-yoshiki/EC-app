Rails.application.routes.draw do
  namespace :admin do
    resources :users, only: [:index,:show,:edit,:update]
    resources :items
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end