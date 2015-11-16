class PortalPost < ActiveRecord::Base
  # Use forum_theme as a rolify resource
  resourcify

  # Each forum_topic has an owner and some forum_posts
  belongs_to :ong
	
	validates :author, presence: true
	# Paperclip gem sintax for upload image files.
	has_attached_file :image_file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/
	validates :author, presence: true
	validates :title, presence: true
	validates :body, presence: true
end
