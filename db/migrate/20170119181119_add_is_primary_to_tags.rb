class AddIsPrimaryToTags < ActiveRecord::Migration[5.0]
  def change
    add_column :tags, :is_primary, :boolean
  end
end
