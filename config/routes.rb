Rails.application.routes.draw do
  root "tasks#index"
  resources :tasks, except: %i[edit update show] do
    member { post :toggle }
  end
end
