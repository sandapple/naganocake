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
      resource :customers, only:[:show, :edit, :update]
      resources :items, only:[:index, :show]
      resources :cart_items, omly
  end
end
