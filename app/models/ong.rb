class Ong < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  validates :name, :length => {:minimum => 2, :message => "must have at least 2 characters"}
  validates :name, :uniqueness => {:message => "already taken"}
end
