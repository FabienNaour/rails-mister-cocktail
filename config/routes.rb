Rails.application.routes.draw do

    resources :cocktails, only: [:create, :index, :new, :show, :destroy] do
      resources :doses, only: [ :create, :new]
    #  resources :ingredients, only: [:create]
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



