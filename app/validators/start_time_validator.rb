# This file contains a custom validator that is remotelly called at /application.rb
# The Start Time Validator validates the begginig date of each event.
class StartTimeValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		if !value.nil? and is_in_the_past?(value)
			record.errors.add attribute, 'must not be in the past'
		end
	end

	private
		def is_in_the_past?(value)
			# To register an event, the user should select current day or any later day
			return value < DateTime.now.midnight
		end
end
