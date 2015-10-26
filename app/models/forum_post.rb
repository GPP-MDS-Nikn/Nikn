class ForumPost < ActiveRecord::Base
	belongs_to :forum_theme
	belongs_to :forum_topic

	validates(:title, presence: true)
	validates(:title, length: {in: 3..30})

	validates(:content, presence: true)
	validates(:content, length: {in: 10..1000})

end