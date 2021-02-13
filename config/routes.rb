Rails.application.routes.draw do

  devise_for :users, controllers: {
    passwords:          'users/passwords',
    registrations:      'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks',
    sessions:           'users/sessions',
    confirmations:      "users/confirmations"
  }

  authenticated :user do
    scope module: :user do
      resource :user_profile, only: [:edit, :update]
      resource :articles, only: [:new, :create]
    end
  end

  devise_scope :user do
    authenticated :user do
      root 'static_pages#home', as: :authenticated_root
    end
  end

  namespace :api, format: 'json' do
    namespace :v1 do
      resource  :stripe_checkout_session, only: [:create]
      resource  :stripe_webhook, only: [:create]
    end
  end

  root 'static_pages#home'
  #未ログインユーザーの、上記以外のURLへのアクセスは全てトップページに飛ばす
  get "*any_path", to: redirect { |p, req| '/' }
end
