Rails.application.routes.draw do
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about', as: 'about'

  scope module: :public do

    resources :items, only: [:index, :show]
  end

  namespace :admin do
    resources :users, only: [:index,:show,:edit,:update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
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
