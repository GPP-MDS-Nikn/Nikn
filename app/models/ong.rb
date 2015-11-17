class Ong < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable
  
	# Give it roles
  rolify
  
	# Include default role to an user after its creation
  after_create :default_role 
	
	# Associate with forum_topics, events, and portal_posts
  has_many :forum_topics, dependent: :destroy
  has_many :events, 			dependent: :destroy
  has_many :portal_posts, dependent: :destroy

  # Validations
  #validates :name, presence: true
  #validates :name, :length => {:minimum => 2}
  #validates :name, uniqueness: true

	# Add a default role to an user at its creation
  private 
	  def default_role
	    self.roles << Role.find_by_name("ong")
	    self.save
	  end
end
