class PortalPost < ActiveRecord::Base
  validates :author, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
