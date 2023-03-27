Rails.application.routes.draw do

  namespace :public do
    get 'cart_items/index'
  end
    devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


     namespace :admin do
     get 'homes/top'
     post 'items' => 'items#create'
     resources :genres, only:[:index, :create, :edit, :update]
     resources :items, only:[:index, :new, :create, :show, :edit, :update]
     resources :customers, only:[:index, :show, :edit, :update]
   end

  scope module: :public do
      get 'homes/top'
      get 'homes/about'
      get "/customers/my_page", to: 'customers#show', as: :my_page_customers
      get "/customers/informaition/edit", to: 'customers#edit',as: :edit_customers
      get 'customers', to: 'customers#unsubscribe',as: :unsubscribe_customers
      patch 'customers', to: 'customers#withdraw'
      patch 'customers_update' , to: 'customers#update',as: :update_customers
      resources :items, only:[:index, :show]
      resources :cart_items, only:[:index, :update, :create, :destroy, :destroy_all]
  end
end
