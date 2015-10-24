class ForumTopic < ActiveRecord::Base
	belongs_to :forum_theme
	has_many :forum_posts, dependent: :destroy
end