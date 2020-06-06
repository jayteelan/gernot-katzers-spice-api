Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
	ActiveAdmin.routes(self)
	
	scope '/api' do
		# resources :spice_constituents
		resources :parts
		# resources :images
		resources :origins
		resources :constituents
		resources :families
		resources :spices
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
