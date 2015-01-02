class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :set_meta_hash
  protect_from_forgery with: :exception
  include ApplicationHelper
  include SessionHelper
  include ActionView::Helpers::AssetTagHelper

  def set_meta_hash
	  @meta = {
	  	title: "RyanValle.me",
	  	url: "http://ryanvalle.me",
	  	description: "Welcome to my blog-folio, a hybrid blog &amp; portfolio site joined into a single page experience. I'll be blogging about a variety of things from photography adventures, thoughts, opinions, and reviews about the latest gadgets, and once in a while, talk a little about my work life and write about web development related stuff.",
	  	ogimage: get_image_url("og-image.jpg")
	  }
	end
end
