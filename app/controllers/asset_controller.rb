class AssetController < ApplicationController
	skip_before_filter :verify_authenticity_token, :only => [:create]

	def new 
		@image = Asset.new
	end

	def create
		@image = Asset.new(file: params[:upload])
		if @image.save
			render inline: "<script>window.parent.CKEDITOR.tools.callFunction(#{params[:CKEditorFuncNum]},'#{@image.file}');</script>".html_safe
		else 
			render json: @image, status: "500"
		end
	end

	def destroy
		@image = Asset.find(params[:id])
		if signed_in?
			@image.destroy
			render json: @image, status: :ok
		else
			render json: @image, status: :unauthorized
		end
	end

	private
		def asset_params
			params.require(:asset).permit(:file)
		end
end
