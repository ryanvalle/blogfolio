Rails.application.routes.draw do
  root 'blogfolio#index'

  get '/article/:address' => 'blogfolio#show', as: 'show_blog'

  resources :admin, :path => "admin", only: [:index, :new, :create]
  	post '/session' => 'admin#auth', as: "session"
  	get '/signout' => 'admin#signout', as: "admin_signout"
		get '/admin/assets' => "admin#assets", as: "assets_admin"
		get '/admin/articles' => "admin#articles", as: "articles_admin"
		get '/admin/edit/:id' => "admin#edit", as: "edit_admin"
		patch '/admin/update' => 'admin#update', as: 'update_admin'
		get '/admin/password' => 'admin#password', as: "password_admin"
		post '/admin/update-password' => 'admin#password_update', as: "password_update"
		post '/admin/update-user' => 'admin#user_update', as: "user_update"

	resources :asset, :path => "gallery"
		post '/admin/asset-upload' => "asset#create", as: "create_gallery"
		delete '/admin/asset-destroy' => 'asset#destroy', as: 'destroy_asset'
end