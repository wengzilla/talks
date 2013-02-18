class CreateTableTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.string :description
      t.text   :transitions
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
      t.string :url
      t.text :data
      t.timestamps
    end
  end
end
