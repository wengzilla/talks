class CreateTableTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.string :description
      t.text   :transitions
      t.integer :user_id
      t.timestamps
    end

    create_table :presentations do |t|
      t.integer :talk_id
      t.string :title
      t.string :url
      t.string :token
      t.string :author_name
      t.string :author_url
      t.text :data
      t.timestamps
    end

    create_table :videos do |t|
      t.integer :talk_id
      t.string  :external_source
      t.string  :external_id
      t.string  :external_author
      t.string  :title
      t.string  :image
      t.text    :data
      t.integer :duration
      t.string  :url
      t.timestamps
    end
  end
end
