class ForumTheme< ActiveRecord::Base
	# Use forum_theme as a rolify resource
  resourcify

	has_many :forum_topics, dependent: :destroy

	TITLE_MIN_LENGTH = 2
	DESCRIPTION_MIN_LENGTH = 2

	validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
	validates :description, presence: true, :length => {:minimum => DESCRIPTION_MIN_LENGTH}

end
