class CreateForumTopics < ActiveRecord::Migration
  def change
    create_table :forum_topics do |t|
      t.string :author
      t.string :title
      t.text :body
      t.references :forum_theme, index: true
      t.timestamps null: false
    end
  end
end