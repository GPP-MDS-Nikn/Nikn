class Event < ActiveRecord::Base
	# Paperclip gem sintax for upload image files.
	has_attached_file :image_file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
		validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/


	# Impossible to create an event without a name
	validates(:title, presence: true)
	validates(:title, length: {in: 3..60})

	# Impossible to create an event without a local
	validates(:local, presence: true)

	# The local string must be bigger than 6 characters and
	# shorter than 80.
	validates(:local, length: {in: 6..80})

	# Impossible to create an event without a description text
	validates(:description, presence: true)

	# The description text must be bigger than 20 characters
	# and shorter than 1001. These numbers were arbitrarily selected.
	# subject to changes.
	validates(:description, length: {in: 20..1000})

	searchable do
		text :title
		#text :local
		#time :start_time
		#time :end_time
	end
end
