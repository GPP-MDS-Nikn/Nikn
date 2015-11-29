class CreateForumTopics < ActiveRecord::Migration
  def change
    create_table :forum_topics do |t|
      t.string :author
      t.string :title
      t.text :body
      t.belongs_to :forum_theme, index: true
      t.integer :reports
      t.timestamps null: false
    end
  end
end
