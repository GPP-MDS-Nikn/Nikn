class ForumTheme< ActiveRecord::Base
	has_many :forum_topics, dependent: :destroy
	validates :title, presence: true, :length => {:minimum => 2}, uniqueness: true
	validates :description, presence: true, :length => {:minimum => 2}

end