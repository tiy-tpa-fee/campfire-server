class InitialSchema < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :auth0
      t.string :name
      t.string :email
      t.string :avatar_url
      t.string :token
      t.json :profile

      t.timestamps
    end

    create_table :stories do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :description
      t.string :kind
      t.string :thumbnail_url
      t.string :image_url

      t.timestamps
    end

    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :story, foreign_key: true
      t.string :message

      t.timestamps
    end

    create_table :tags do |t|
      t.string :name
    end

    create_table :taggings do |t|
      t.references :story, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
