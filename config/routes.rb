Rails.application.routes.draw do
  root 'blogfolio#index'

  resources :admin, :path => "admin", only: [:index, :new, :create]
  	post '/session' => 'admin#auth', as: "session"
  	get '/signout' => 'admin#signout', as: "admin_signout"
		get '/admin/images' => "admin#images", as: "images_admin"
		get '/admin/articles' => "admin#articles", as: "articles_admin"
		get '/admin/edit/:id' => "admin#edit", as: "edit_admin"
		patch '/admin/update' => 'admin#update', as: 'update_admin'
end
