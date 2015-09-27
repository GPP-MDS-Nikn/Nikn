class CreatePortalPosts < ActiveRecord::Migration
  def change
    create_table :portal_posts do |t|
      t.string :author
      t.string :title
      t.string :body
      t.timestamps null: false
    end
  end
end
