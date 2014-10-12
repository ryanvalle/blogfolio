class Asset < ActiveRecord::Base
	mount_uploader :file, ImageUploader
end
