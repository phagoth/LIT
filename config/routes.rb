Rails.application.routes.draw do
  get 'contacts/index'

  devise_for :users
  root to: 'main#index'

end
