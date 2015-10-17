class CreateForumRopics < ActiveRecord::Migration
  def change
    create_table :forum_topics do |t|
      t.string :author
      t.string :title
      t.string :body
      t.timestamps null: false
    end
  end
end