class ForumTopic < ActiveRecord::Base
	# Use forum_theme as a rolify resource
  resourcify

  # Each forum_topic has an owner and some forum_posts
  belongs_to :ong
	has_many :forum_posts, dependent: :destroy

  # Validations
	TITLE_MIN_LENGTH = 2
	BODY_MIN_LENGTH = 2

	validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
	validates :body, presence: true, :length => {:minimum => BODY_MIN_LENGTH}
end
