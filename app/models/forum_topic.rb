class ForumTopic < ActiveRecord::Base
	belongs_to :forum_theme
	has_many :forum_post, dependent: :destroy
end