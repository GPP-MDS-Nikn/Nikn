class CreateForumThemes < ActiveRecord::Migration
  def change
    create_table :forum_themes do |t|
      t.string :title
      t.text :description
      t.timestamps null: false
    end
  end
end