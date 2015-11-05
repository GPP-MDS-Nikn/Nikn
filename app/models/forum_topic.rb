class ForumTopic < ActiveRecord::Base

	TITLE_MIN_LENGTH = 2

	BODY_MIN_LENGTH = 2

	has_many :forum_posts, dependent: :destroy

	validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
	validates :body, presence: true, :length => {:minimum => BODY_MIN_LENGTH}

	# Associate a forum topic with an ONG
  belongs_to :ong
  
end
