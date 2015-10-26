class ForumPost < ActiveRecord::Base

	TITLE_MIN_LENGTH = 3  # characters
	TITLE_MAX_LENGTH = 30 # characters
	
	CONTENT_MIN_LENGTH = 10	# characters
	CONTENT_MAX_LENGTH = 1000	# characters


	#belongs_to :forum_theme
	belongs_to :forum_topic

	validates(:title, presence: true)
	validates(:title, length: {in: 3..30})

	validates(:content, presence: true)
	validates(:content, length: {in: 10..1000})

end