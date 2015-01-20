class AddSeoImageToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :seo_image, :string
  end
end
