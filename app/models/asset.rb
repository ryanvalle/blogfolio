# == Schema Information
#
# Table name: assets
#
#  id         :integer          not null, primary key
#  file       :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Asset < ActiveRecord::Base
	mount_uploader :file, ImageUploader
end
