class ForumPost < ActiveRecord::Base
	belongs_to :forum_topic

	validates :content, presence: true, :length => {:minimum => 1}
	
end