class AdminController < ApplicationController
	before_filter :signed_in_user, only: [:show, :new, :edit, :update,:create, :articles, :password, :password_update, :user_update]

	def index
		if signed_in?
			redirect_to articles_admin_path
		end
	end

	def articles
		per_page = 25
		if params[:page].present?
			start_at = (params[:page].to_i * per_page.to_i) - per_page.to_i
			@articles = Article.all.limit(per_page).offset(start_at).order("id DESC")
			@next_articles = Article.all.limit(per_page).offset(start_at + per_page).order("id DESC")
		else
			@articles = Article.all.limit(per_page).order("id DESC")
			@next_articles = Article.all.limit(per_page).offset(1 + per_page).order("id DESC")
		end
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def create
		params[:article][:address] = params[:article][:address].gsub(/ /,'-')
		article_new = Article.new(article_params)
		if article_new.save
			redirect_to admin_index_path
		else
			redirect_to root_path
		end
	end

	def update
		article_update = Article.find(params[:article][:id])
		if article_update.update_attributes(article_params)
			flash[:notice] = "#{article_update.title} was updated"
			redirect_to articles_admin_path
		else
			flash[:notice] = "Error saving"
			redirect_to edit_admin_path(article_update.id)
		end
	end

	def auth
		admin = User.find_by_name(params[:admin][:name])
		if admin && admin.authenticate(params[:admin][:password])
			flash[:success] = "Login Success"
			sign_in(admin)
			redirect_to admin_index_path
		else
			flash[:danger] = "Invalid username/password"
			sign_out
			redirect_to admin_index_path
		end
	end

	def password
	end

	def password_update
		if params[:user][:password].present? && params[:user][:password_confirmation].present?
			if current_user && current_user.authenticate(params[:user][:current_pw])
				@current_user = User.find(current_user)
				if @current_user.update_attributes(update_user)
					flash[:notice] = "Successfully updated password"
				else
					flash[:notice] = "Failed to update password"
				end
			else
				flash[:notice] = "Failed to authenticate old password"
			end
		else
			flash[:notice] = "New password and confirmation must not be blank"
		end
			redirect_to password_admin_path
	end

	def user_update
		if current_user && current_user.authenticate(params[:user][:password])
			@current_user = User.find(current_user)
			if @current_user.update_attributes(update_user)
				flash[:notice] = "Successfully updated username"
			else
				flash[:notice] = "Failed to update username"
			end
		else
			flash[:notice] = "Failed to authenticate"
		end
		redirect_to password_admin_path
	end
	
	def signout
		sign_out
		redirect_to admin_index_path
	end

	private
		def signed_in_user
			unless signed_in?
				store_location
				redirect_to admin_index_path
			end
		end

		def article_params
			params.require(:article).permit(:id, :title, :address, :body, :user_id, :status, :gallery_id, :exifshow)
		end

		def update_user
			params.require(:user).permit(:name, :password, :password_confirmation)
		end
end
