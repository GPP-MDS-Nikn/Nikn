class MortalityRate < ActiveRecord::Base
	# Use forum_post as a rolify resource
  resourcify

	validates :regiao, presence: true
	validates :nome, presence: true
	validates :taxa, presence: true
end
