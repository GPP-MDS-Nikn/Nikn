# This class adds a image path field for all portal_posts.
class AddPictureFieldAtPortalPostModel < ActiveRecord::Migration
	def up
    add_attachment :portal_posts, :image_file
  end

  def down
    remove_attachment :portal_posts, :image_file
  end
end
