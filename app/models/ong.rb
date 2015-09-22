class Ong < ActiveRecord::Base
	#This won't allow the creation of ONGs without names, or with names with lenght less than 3, or bigger than 40 characters
	validates(:name, presence: true)
	validates(:name, length: {in: 3..40})
end