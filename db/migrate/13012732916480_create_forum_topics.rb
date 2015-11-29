class CreateForumTopics < ActiveRecord::Migration
  def change
    create_table :forum_topics do |t|
    	t.belongs_to :ong, index: true
    	
      t.string :author
      t.string :title
      t.text :body
      t.integer :reports
      t.references :forum_theme, index: true
      t.timestamps null: false
    end
  end
end
