class Event < ActiveRecord::Base
	# Paperclip gem sintax for upload image files.
	has_attached_file :image_file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/


	# Impossible to create an event without a name
	validates(:name, presence: true)
	validates(:name, length: {in: 10..40})

	# Impossible to create an event without a local
	validates(:local, presence: true)

	# The local string must be bigger than 6 characters and
	# shorter than 41.
	validates(:local, length: {in: 6..40})

	# Impossible to create an event without a description text
	validates(:description, presence: true)

	# The description text must be bigger than 140 characters
	# and shorter than 1001. These numbers were arbitrarily selected.
	# subject to changes.
	validates(:description, length: {in: 140..1000})

end
