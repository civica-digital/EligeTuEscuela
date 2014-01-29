EligeTuEscuela::Application.routes.draw do

  resources :schools, only: :show do
    post :filter, on: :collection
  end

  get :search, to: 'schools#search', as: :search
  root 'pages#home'
end
