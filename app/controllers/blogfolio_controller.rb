class BlogfolioController < ApplicationController
	def index
		@articles = Article.all.where(status: 1).order("id DESC")
	end

end