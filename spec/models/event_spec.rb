require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
	context "when providing valid data" do
		
		# Valid tests
		it "should be an instance of Event" do
			event = create_event # Only valid data
			expect(event).to be_instance_of(Event)
		end
	end

	context "when providing invalid data" do
		
		# Title tests
		it "should be invalid without a title" do
			event = create_event(title: nil)
			expect(event.valid?).to be false
			expect(event.errors[:title].size).to be > 0 # weird sintax to cat errors
		end

		it "should be invalid with short title" do
			event = create_event(title: "a" * (Event::TITLE_MIN_LENGTH - 1))
			expect(event.valid?).to be false
		end

		it "should be invalid with too long titles" do
			event = create_event(title: "a" * (Event::TITLE_MAX_LENGTH + 1))
			expect(event.valid?).to be false
		end

		#	Local tests
		it "should be invalid without a local" do
			event = create_event(local: nil)
			expect(event.valid?).not_to be true
		end

		it "should be invalid with short local text" do
			event = create_event(local: "a" * (Event::LOCAL_MIN_LENGTH - 1))
			expect(event.valid?).not_to be true
		end

		it "should be invalid with too long local text" do
			event = create_event(local: "a" * (Event::LOCAL_MAX_LENGTH + 1))
			expect(event.valid?).not_to be true
		end

		# Description tests
		it "should be invalid without a description" do
			event = create_event(description: nil)
			expect(event.valid?).to be false
		end

		it "should be invalid with short description" do
			event = create_event(description: "a" * (Event::DESCRIPTION_MIN_LENGTH - 1))
			expect(event.valid?).to be false
		end

		it "should be invalid with too long description" do
			event = create_event(description: "a" * (Event::DESCRIPTION_MAX_LENGTH + 1))
			expect(event.valid?).to be false
		end

		# DateTime tests
		it "should be invalid without a start time" do
			event = create_event(start_time: nil)
			expect(event.valid?).to be false
		end

		it "should be invalid without an end time" do
			event = create_event(end_time: nil)
			expect(event.valid?).to be false
		end

		it "should be invalid beggining in the past" do
			event = create_event(start_time: DateTime.now - 2.days)
			expect(event.valid?).to be false
		end

	end

	private
		# Default settings to test.
		# Only valid fields.
		def create_event(options={})
			Event.create({
				title: "Event's name",
				local: "Event's local",
				description: "Event's test description",
				start_time: DateTime.now,
				end_time: 2.days.from_now
			}.merge(options))
		end

end


