Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks do
    member { post :toggle }
  end
end
