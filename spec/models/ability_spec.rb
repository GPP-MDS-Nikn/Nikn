# This file includes tests for access restriction. 
# The Ability model (from CanCanCan gem) is used to define abilities of users based on their roles. 
# So, this tester basically tests the access restriction of users to any route and resource they may try to access.

require "cancan/matchers"
require 'rails_helper'

describe Ability do
	# First, load the seed.rb file in order to initialize default roles
	Rails.application.load_seed
	
	context "when is an admin" do
		it "should be able to manage all" do
			ong = create_ong # Only valid data
			ong.add_role(:admin)
			ability = Ability.new(ong)
			expect(ability).to be_able_to(:manage, ForumTheme)
			expect(ability).to be_able_to(:manage, ForumTopic)
			expect(ability).to be_able_to(:manage, ForumPost)
			expect(ability).to be_able_to(:manage, MortalityRate)
			expect(ability).to be_able_to(:manage, PortalPost)
			expect(ability).to be_able_to(:manage, Event)
		end
	end
	
	context "when is an ong" do
		it "should be able to manage forum topics, events and portal posts they are owner" do
			ong = create_ong # Only valid data
			ability = Ability.new(ong)
			expect(ability).to be_able_to(:manage, create_forum_topic(:ong_id => ong.id))
			expect(ability).to be_able_to(:manage, create_event(:ong_id => ong.id))
			expect(ability).to be_able_to(:manage, create_portal_post(:ong_id => ong.id))
		end

		it "should be able to create forum topics, forum posts, events and portal posts" do
			ong = create_ong # Only valid data
			ability = Ability.new(ong)
			expect(ability).to be_able_to(:create, ForumTopic)
			expect(ability).to be_able_to(:create, ForumPost)
			expect(ability).to be_able_to(:create, Event)
			expect(ability).to be_able_to(:create, PortalPost)
		end

		it "should be able to read all" do
			ong = create_ong # Only valid data
			ability = Ability.new(ong)
			expect(ability).to be_able_to(:read, create_forum_theme)
			expect(ability).to be_able_to(:read, create_forum_topic)
			expect(ability).to be_able_to(:read, create_forum_post)
			expect(ability).to be_able_to(:read, create_mortality_rate)
			expect(ability).to be_able_to(:read, create_portal_post)
			expect(ability).to be_able_to(:read, create_event)
		end

		it "should not be able to create forum themes and mortality rates" do
			ong = create_ong # Only valid data
			ability = Ability.new(ong)
			expect(ability).not_to be_able_to(:create, ForumTheme)
			expect(ability).not_to be_able_to(:create, MortalityRate)
		end

		it "should not be able to edit, destroy or update any model they are not owner" do
			ong = create_ong # Only valid data
			ability = Ability.new(ong)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_forum_theme)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_forum_topic)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_forum_post)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_mortality_rate)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_event)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_portal_post)
		end
	end

	context "when is guest user (not logged in)" do
		it "should be able to create forum posts" do
			ong = Ong.new # guest user (not logged in)
			ability = Ability.new(ong)
			expect(ability).to be_able_to(:create, ForumPost)
		end

		it "should be able to read all" do
			ong = Ong.new # guest user (not logged in)
			ability = Ability.new(ong)
			expect(ability).to be_able_to(:read, create_forum_theme)
			expect(ability).to be_able_to(:read, create_forum_topic)
			expect(ability).to be_able_to(:read, create_forum_post)
			expect(ability).to be_able_to(:read, create_mortality_rate)
			expect(ability).to be_able_to(:read, create_portal_post)
			expect(ability).to be_able_to(:read, create_event)
		end

		it "should not be able to create models, except forum posts" do
			ong = Ong.new # guest user (not logged in)
			ability = Ability.new(ong)
			expect(ability).not_to be_able_to(:create, ForumTheme)
			expect(ability).not_to be_able_to(:create, ForumTopic)
			expect(ability).not_to be_able_to(:create, MortalityRate)
			expect(ability).not_to be_able_to(:create, Event)
			expect(ability).not_to be_able_to(:create, PortalPost)
		end

		it "should not be able to edit, destroy or update any model" do
			ong = Ong.new # guest user (not logged in)
			ability = Ability.new(ong)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_forum_theme)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_forum_topic)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_forum_post)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_mortality_rate)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_event)
			expect(ability).not_to be_able_to([:edit, :destroy, :update], create_portal_post)
		end
	end

	# Methods below are used to create instances of models
	private		

		# Create Ong with default parameters, only valid fields
		def create_ong(options={})
			Ong.create({
			email: "example@email.com",
			password: "password",
			password_confirmation: "password"
			}.merge(options))
		end
		
		# Create Event with default parameters, only valid fields
		def create_event(options={})
			Event.create({
			title: "Event's name",
			local: "Event's local",
			description: "Event's test description",
			start_time: DateTime.now,
			end_time: 2.days.from_now
			}.merge(options))
		end
		
		# Create PortalPost with default parameters, only valid fields
		def create_portal_post(options={})
			PortalPost.create({
			author: "Author example",
			title: "Portal post title example",
			body: "Portal post body example"
			}.merge(options))
		end
		
		# Create MortalityRate with default parameters, only valid fields
		def create_mortality_rate(options={})
			MortalityRate.create({
			regiao: 'Norte',
			nome: 'Manaus',
			taxa: '10,5'
			}.merge(options))
		end
		
		# Create ForumPost with default parameters, only valid fields
		def create_forum_post(options={})
			ForumPost.create({
			title: "Forum post title sample",
			content: "Forum post content sample"
			}.merge(options))
		end
		
		# Create ForumTopic with default parameters, only valid fields
		def create_forum_topic(options={})
			ForumTopic.create({
			title: "Forum topic title sample",
			body: "Forum topic body sample"
			}.merge(options))
		end
		
		# Create ForumThemes with default parameters, only valid fields
		def create_forum_theme(options={})
			ForumTheme.create({
			title: "Forum theme title sample",
			description: "Forum theme description sample"
			}.merge(options))
		end

end
