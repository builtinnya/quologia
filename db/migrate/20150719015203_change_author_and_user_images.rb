class ChangeAuthorAndUserImages < ActiveRecord::Migration
  def change
    change_column :quotes, :author_image, :text
    change_column :users, :image_url, :text
  end
end
