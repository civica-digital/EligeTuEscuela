EligeTuEscuela::Application.routes.draw do

  resources :schools, only: :show

  get :search, to: 'schools#search', as: :search
  root 'pages#home'
end
