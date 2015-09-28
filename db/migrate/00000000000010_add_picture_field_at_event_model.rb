# This class adds a image path field for all events.
class AddPictureFieldAtEventModel < ActiveRecord::Migration
	def up
    add_attachment :events, :image_file
  end

  def down
    remove_attachment :events, :image_file
  end
end
