class AssetController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:create]

	def new 
		@image = Asset.new
	end

	def create
		@image = Asset.new(file: params[:upload])
		if @image.save
			render inline: "<script>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]},'#{@image.file.md}');</script>".html_safe
		else 
			render json: @image, status: "500"
		end
	end

	def destroy
		@image = Gallery.find(params[:id])
		@image.destroy
		redirect_to images_admin_path, notice: "#{@image.name} was deleted"
	end

	private
		def asset_params
			params.require(:asset).permit(:file)
		end
end
