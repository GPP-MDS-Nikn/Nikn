require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PortalPost do
	context "when providing valid data" do
		
		# Valid tests
		it "should be an instance of PortalPost" do
			portal_post = create_portal_post # Only valid data
			expect(portal_post).to be_instance_of(PortalPost)
		end
	end

	context "when providing invalid data" do
		
		# Author tests
		it "should be invalid without an author" do
			portal_post = create_portal_post(author: nil)
			expect(portal_post.valid?).to be false
			expect(portal_post.errors[:author].size).to be > 0
		end

		# Title tests
		it "should be invalid without a title" do
			portal_post = create_portal_post(title: nil)
			expect(portal_post.valid?).to be false
			expect(portal_post.errors[:title].size).to be > 0
		end

		# Body tests
		it "should be invalid without a body" do
			portal_post = create_portal_post(body: nil)
			expect(portal_post.valid?).to be false
			expect(portal_post.errors[:body].size).to be > 0
		end
	end

	private
		# Default settings to test.
		# Only valid fields.
		def create_portal_post(options={})
			PortalPost.create({
				author: "here comes the author",
				title: "that's the title",
				body: "and finally the body"
			}.merge(options))
		end
end