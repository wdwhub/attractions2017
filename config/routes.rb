Rails.application.routes.draw do
  get 'attractions/index'

  get 'attractions/show'

  # root to: 'attractions#index'

  resources :attractions

end
