class Event < ActiveRecord::Base
	# Use event as a rolify resource
  resourcify

  # Each event has an owner
  belongs_to :ong

	# Event Model Constants
	TITLE_MIN_LENGTH = 3  # characters
	TITLE_MAX_LENGTH = 60 # characters
	
	LOCAL_MIN_LENGTH = 6	# characters
	LOCAL_MAX_LENGTH = 80	# characters

	DESCRIPTION_MIN_LENGTH = 20	# characters
	DESCRIPTION_MAX_LENGTH = 1000	# characters

	# Paperclip gem sintax for upload image files.
	has_attached_file :image_file, :styles => {}, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/


	# Impossible to create an event without a name
	validates(:title, presence: true)
	validates(:title, length: {in: TITLE_MIN_LENGTH..TITLE_MAX_LENGTH})

	# Impossible to create an event without a local
	validates(:local, presence: true)

	# The local string must be bigger than 6 characters and
	# shorter than 80.
	validates(:local, length: {in: LOCAL_MIN_LENGTH..LOCAL_MAX_LENGTH})

	# Impossible to create an event without a description text
	validates(:description, presence: true)

	# The description text must be bigger than 20 characters
	# and shorter than 1001. These numbers were arbitrarily selected.
	# subject to changes.
	validates(:description, length: {in: DESCRIPTION_MIN_LENGTH..DESCRIPTION_MAX_LENGTH})

	# Impossible to create an event without a date
	validates(:start_time, presence: true)
	validates(:end_time, presence: true)

	# Impossible to create an event in the past
	# It is a custom validator, read more at /app/validators/start_time_validator.rb
	validates(:start_time, start_time: true)
end
