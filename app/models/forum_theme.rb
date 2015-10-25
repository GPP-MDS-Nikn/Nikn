class ForumTheme< ActiveRecord::Base
	has_many :forum_topics, dependent: :destroy
end