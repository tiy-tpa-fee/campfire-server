class AddIsFeaturedToStories < ActiveRecord::Migration[5.0]
  def change
    add_column :stories, :is_featured, :boolean
  end
end
