class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :kind
      t.string :thumbnail_url
      t.string :image_url

      t.timestamps
    end
  end
end
