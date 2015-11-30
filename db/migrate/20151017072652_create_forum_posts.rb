class CreateForumPosts < ActiveRecord::Migration
  def change
    create_table :forum_posts do |t|
      t.string :author
      t.text :content
      t.references :forum_topic, index: true
      t.references :forum_theme, index: true
      t.integer :reports
      t.timestamps null: false
    end
  end
end
