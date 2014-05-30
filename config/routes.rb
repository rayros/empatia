Kwejk::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_for :admins, :skip => [:registrations, :passwords] 
  as :admin do
    get '' => 'posts#index', :as => :new_admin_registration
    get '' =>'posts#index', :as => :new_admin_password
  end
  root 'posts#index'
  resources :users, only: [:index, :show, :destroy]
  resources :posts do
    member do
      get 'mark_accepted'
      get 'mark_not_accepted'
      get 'fb_update'
    end
    collection do
      get 'waiting_room'
      get 'hotness'
      get 'top'
      get 'feed'
    end
  end
end
