module ApplicationHelper
	def nextPage(copy) 
		page = params[:page].present? ? (params[:page].to_i + 1) : 2
		next_article = @next_articles.present? ? @next_articles.count : 0
		if next_article > 0 && page > 0
			render inline: "<div class='nextpage'>#{(link_to copy, root_path(page: page), class: 'font-300')}</div>"
		end
	end

	def prevPage(copy)
		page = (params[:page].to_i > 1) ? (params[:page].to_i - 1) : 0
		if page > 0
			render inline: "<div class='prevpage'>#{(link_to copy, root_path(page: page), class: 'font-300')}</div>"
		end
	end

	def adminNextPage(copy) 
		page = params[:page] ? (params[:page].to_i + 1) : 2
		next_article = @next_articles ? @next_articles.count : 0
		if next_article > 0 && page > 0
			render inline: "<div class='nextpage'>#{(link_to copy, articles_admin_path(page: page), class: 'font-300')}</div>"
		end
	end

	def adminPrevPage(copy)
		page = (params[:page].to_i > 1) ? (params[:page].to_i - 1) : 0
		if page > 0
			render inline: "<div class='prevpage'>#{(link_to copy, articles_admin_path(page: page), class: 'font-300')}</div>"
		end
	end

	def get_image_url(image)
		view_context.image_url(image)
	end
end
