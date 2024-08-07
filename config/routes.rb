Rails.application.routes.draw do
  root 'sessions#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'home', to: 'teachers#home'
  resources :students
  get 'delete_student/:id',to: "students#delete_student",as: 'delete_student'
end