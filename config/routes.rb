Rails.application.routes.draw do
  get 'customers/index'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/update'
  namespace :admin do
    post 'items' => 'items#create'
    resources :genres, only:[:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :show, :edit, :update]
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

#devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
  #sessions: "admin/sessions"
#}
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
end
