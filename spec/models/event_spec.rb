require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Event do
	before(:each) do
		@event = create_event
	end

	context "when providing valid data" do
		it "should be an instance of Event" do
			expect(@event).to be_instance_of(Event)
		end

		it "should be invalid without a title" do
			@event.title = nil
			expect(@event.valid?).to be false
			expect(@event.errors[:title].size).to be > 0 # weird sintax to cat errors
		end

	end

=begin
	context "when providing invalid data" do
	end
	
	it "should be valid" do
		lambda {
			event = create_event
			event.expect be_valid
			violated "#{event.errors.full_messages.to_sentence}" if event.new_record?
		}.should change(Event, :count).by(1)
	end

	it "should be invalid without a title" do
		lambda {
			event = create_event(:title => nil)
			event.errors.should be_invalid(:title)
		}.should_not change(Event, :count)
	end

	it "should be invalid with short titles" do
		lambda {
			event = create_event(:title => "a" * (Event::TITLE_MIN_LENGTH - 1))
			event.errors.should be_invalid(:title)
		}.should_not change(Event, :count)
	end

	it "should be invalid with long titles" do
		lambda {
			event = create_event(:title => "a" * (Event::TITLE_MAX_LENGTH + 1))
			event.errors.should be_invalid(:title)
		}.should_not change(Event, :count)
		end
=end

	private

		# Default settings to test
		def create_event(options={})
			Event.create({
				title: "Event's name",
				local: "Event's local",
				description: "Event's test description"
			}.merge(options))
		end

end


