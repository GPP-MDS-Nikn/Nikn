class Ong < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #validates :name, presence: true
  #validates :name, :length => {:minimum => 2}
  #validates :name, uniqueness: true

  has_many :forum_topics
end
