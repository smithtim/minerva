Rails.application.routes.draw do

	root 'journals#index'

  resources :journals do
		resources :entries, except: [:index]
	end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
