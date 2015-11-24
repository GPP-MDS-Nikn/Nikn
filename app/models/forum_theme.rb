class ForumTheme< ActiveRecord::Base
	has_many :forum_topics, dependent: :destroy

    # Paperclip gem sintax for upload image files.
	has_attached_file :image_file, :styles => {}, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/

	TITLE_MIN_LENGTH = 2
	DESCRIPTION_MIN_LENGTH = 2
	validates :title, presence: true, :length => {:minimum => TITLE_MIN_LENGTH}, uniqueness: true
	validates :description, presence: true, :length => {:minimum => DESCRIPTION_MIN_LENGTH}
end
