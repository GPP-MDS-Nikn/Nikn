# This class adds a image path field for all ongs.
class AddPictureFieldAtOngModel < ActiveRecord::Migration
	def up
    add_attachment :ongs, :image_file
  end

  def down
    remove_attachment :ongs, :image_file
  end
end
