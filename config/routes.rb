Rails.application.routes.draw do
  # Root path (optional)
  root "experience#index"
  get "experience/filter", to: "experience#filter", defaults: { format: :json }

  # Resources for categories and experiences
  resources :categories do
    resources :experiences, only: [:index, :new, :create]
    get 'experience', on: :member
     get :filter
  end

  # Independent routes for experiences if you want show/edit/update/destroy
resources :experiences, only: [:index, :show, :edit, :update, :destroy]
end
