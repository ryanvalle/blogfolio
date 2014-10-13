module ApplicationHelper
	def nextPage(copy) 
		page = params[:page] ? (params[:page].to_i + 1) : 2
		next_article = @next_articles ? @next_articles.count : 0
		if next_article > 0 && page > 0
			render inline: "#{(link_to copy, root_path(page: page), class: 'font-300')}"
		end
	end

	def prevPage(copy)
		page = (params[:page].to_i > 1) ? (params[:page].to_i - 1) : 0
		if page > 0
			render inline: "#{(link_to copy, root_path(page: page), class: 'font-300')}"
		end
	end
end
