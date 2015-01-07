class BlogfolioController < ApplicationController
	skip_before_action :verify_authenticity_token
	def index
		per_page = 10
		if params[:page].present?
			start_at = (params[:page].to_i * per_page.to_i) - per_page.to_i
			@articles = Article.all.where(status: 1).limit(per_page).offset(start_at).order("id DESC")
			@next_articles = Article.all.where(status: 1).limit(per_page).offset(start_at + per_page).order("id DESC")
			if @articles.count == 0
					render 'page_blank'
			else
				respond_to do |format|
					format.html
					format.js
				end
			end
		else
			@articles = Article.all.where(status: 1).limit(per_page).order("id DESC")
			@next_articles = Article.all.where(status: 1).limit(per_page).offset(1 + per_page).order("id DESC")
			if @articles.count == 0
				render 'no_articles'
			else
				respond_to do |format|
					format.html
					format.js
				end
			end
		end
	end

	def show
		@article = Article.find_by_address(params[:address])
		@title = "#{@article.title} | RyanValle.me"
		@meta = {
	  	title: @article.title,
	  	url: show_blog_url(params[:address]),
	  	description: view_context.strip_tags(@article.body.split('<hr />')[0]),
	  }

		respond_to do |format|
			format.html
			format.js
		end
	end
end