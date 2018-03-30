Rails.application.routes.draw do
  resources :attendances
  get 'home/index'
  post 'home/mark_attendance' => 'home#mark_attendance'
  resources :departments
  devise_for :employees
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/employee' => 'home#employee_index'
  get '/admin' => 'home#admin_index'

  root 'home#index'
end
