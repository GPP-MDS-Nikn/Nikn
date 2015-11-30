class ForumTopic < ActiveRecord::Base
  # Use forum_topic as a rolify resource
  resourcify

  # Each forum_topic has an owner and some forum_posts
  belongs_to :ong
  after_initialize :default_values
  TITLE_MIN_LENGTH = 2
  BODY_MIN_LENGTH = 2
  has_many :forum_posts, dependent: :destroy

  validates :title, presence: true, length: { minimum: TITLE_MIN_LENGTH }, uniqueness: true
  validates :body, presence: true, length: { minimum: BODY_MIN_LENGTH }
    # Method to search across the topics
    def self.search(search)
      where("body LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")
    end


	private
		def default_values #this will initialize 'reports' attribute with default value 0
			self.reports ||= 0
		end
end
