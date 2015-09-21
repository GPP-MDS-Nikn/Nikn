require 'test_helper'

class EventTest < ActiveSupport::TestCase

	def setup
		@event = Event.new(name: "Example name", local: "Example local", description: "Example description")
	end

	test "should be valid" do
		assert @event.valid?
	end

	test "name should be present" do
		@event.name = "     "
		assert_not @event.valid?
	end
end