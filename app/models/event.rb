class Event < ActiveRecord::Base
	# Impossible to create an event without a name
	validates(:name, presence: true)
	validates(:name, length: {in: 10..40})

	# Impossible to create an event without a local
	validates(:local, presence: true)

	# Impossible to create an event without a description text
	validates(:description, presence: true)

	# The description text must be bigger than 140 characters
	# and shorter than 1000. These numbers were arbitrarily selected.
	# subject to changes.
	validates(:description, length: {in: 140..1000})

end
