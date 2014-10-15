class BlogfolioController < ApplicationController
	def index
		per_page = 5
		if params[:page].present?
			start_at = (params[:page].to_i * per_page.to_i) - per_page.to_i
			@articles = Article.all.where(status: 1).limit(per_page).offset(start_at).order("id DESC")
			@next_articles = Article.all.where(status: 1).limit(per_page).offset(start_at + per_page).order("id DESC")
			if @articles.count == 0
					render 'page_blank'
			end
		else
			@articles = Article.all.where(status: 1).limit(per_page).order("id DESC")
			@next_articles = Article.all.where(status: 1).limit(per_page).offset(1 + per_page).order("id DESC")
			if @articles.count == 0
				render 'no_articles'
			end
		end
	end

	def show
		@article = Article.find_by_address(params[:address])
	end
end