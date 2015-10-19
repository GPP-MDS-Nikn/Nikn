class ForumPost < ActiveRecord::Base
	belongs_to :forum_theme
	belongs_to :forum_topic
end