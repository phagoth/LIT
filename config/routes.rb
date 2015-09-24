Rails.application.routes.draw do
  get 'contacts/index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }
  root to: 'main#index'

end
