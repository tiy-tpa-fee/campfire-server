class AddUrlToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :url, :string
    remove_column :stories, :title
    remove_column :stories, :description
    remove_column :stories, :kind
    remove_column :stories, :thumbnail_url
    remove_column :stories, :image_url
  end
end
