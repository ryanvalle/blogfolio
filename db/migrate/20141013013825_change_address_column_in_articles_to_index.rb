class ChangeAddressColumnInArticlesToIndex < ActiveRecord::Migration
  def up
		change_column :articles, :address, :string, :unique => true
  end
  def down
		change_column :articles, :address, :string, :unique => nil
  end
end
