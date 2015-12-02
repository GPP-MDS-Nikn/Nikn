class AddPictureToTheForumTheme < ActiveRecord::Migration
  def up
    add_attachment :forum_themes, :image_file
  end

  def down
    remove_attachment :forum_themes, :image_file
  end
end
