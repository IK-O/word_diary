Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  devise_for :users
  devise_scope :user do
    get :sign_in, to: 'devise/sessions#new'
    delete :sign_out, to: 'devise/sessions#destroy'
    get :sign_up, to: 'devise/registrations#new'
  end
  get :diaries, to: 'diaries#index', as: :user_root
  resources :users, param: :name do
    resources :diaries do
      collection do
        get :weather_mappings
        get :weather
      end
    end
  end
  root to: 'diaries#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
