require 'test_helper'

class EventTest < ActiveSupport::TestCase

	def setup
		@event = Event.new(name: "Example name", local: "Example local", description: ("a" * 500))
	end

	test "should be valid" do
		assert @event.valid?
	end

	# Name tests
	test "event name should be present" do
		@event.name = ""
		assert_not @event.valid?
	end

	test "event name should not be too long" do
		@event.name = "a" * 41
		assert_not @event.valid?
	end

	test "event name should not be too short" do
		@event.name = "b" * 9
		assert_not @event.valid?
	end

	# Description tests
	test "event description should be present" do
		@event.description = ""
		assert_not @event.valid?
	end

	test "event description should not be too long" do
		@event.description = "a" * 1001
		assert_not @event.valid?
	end

	test "event description should not be too short" do
		@event.description = "b" * 139
		assert_not @event.valid?
	end

	# Local tests
	test "event local text should be present" do
		@event.local = ""
		assert_not @event.valid?
	end

	test "event local text should not be too short" do
		@event.local = "a" * 5
		assert_not @event.valid?
	end

	test "event local text should not be too long" do
		@event.local = "a" * 41
		assert_not @event.valid?
	end

end