class ForumTopic < ActiveRecord::Base
	after_initialize :default_values

	TITLE_MIN_LENGTH = 2

	BODY_MIN_LENGTH = 2

	has_many :forum_posts, dependent: :destroy
	belongs_to :forum_theme

	validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
	validates :body, presence: true, :length => {:minimum => BODY_MIN_LENGTH}

	private
		def default_values #this will initialize 'reports' attribute with default value 0
			self.reports ||= 0
		end
end
