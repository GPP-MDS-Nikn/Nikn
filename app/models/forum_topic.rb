class ForumTopic < ActiveRecord::Base
	has_many :forum_posts, dependent: :destroy
	validates :title, presence: true, :length => {:minimum => 2}, uniqueness: true
	validates :body, presence: true, :length => {:minimum => 2}
end