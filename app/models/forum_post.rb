class ForumPost < ActiveRecord::Base
	after_initialize :default_values

	TITLE_MIN_LENGTH = 3  # characters
	TITLE_MAX_LENGTH = 30 # characters

	CONTENT_MIN_LENGTH = 2	# characters
	CONTENT_MAX_LENGTH = 1000	# characters


	#belongs_to :forum_theme
	belongs_to :forum_topic

	#validates(:title, presence: true)
	#validates(:title, length: {in: 3.30})

	validates(:content, presence: true)
	validates(:content, length: {in: 2..1000})
	private
		def default_values
			self.reports ||= 0
		end
end
