class ForumTheme< ActiveRecord::Base
	has_many :forum_topics, dependent: :destroy

	TITLE_MIN_LENGTH = 2
	DESCRIPTION_MIN_LENGTH = 2

	validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
	validates :description, presence: true, :length => {:minimum => DESCRIPTION_MIN_LENGTH}

end
