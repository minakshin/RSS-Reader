# Migration for entries
class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :title
      t.datetime :published
      t.text :content
      t.string :url
      t.string :author
      t.belongs_to :feed, index: true

      t.timestamps null: false
    end
    add_foreign_key :entries, :feeds
  end
end
