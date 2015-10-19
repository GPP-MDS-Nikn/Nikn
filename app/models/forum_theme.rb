class ForumTheme< ActiveRecord::Base
	has_many :forum_topics, dependent: :destroy
	has_many :forum_posts
end