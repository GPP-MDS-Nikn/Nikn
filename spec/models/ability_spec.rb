# This file includes tests for access restriction. 
# The Ability model (from CanCanCan gem) is used to define abilities of users based on their roles. 
# So, this tester basically tests the access restriction of users to any route and resource they may try to access.

require "cancan/matchers"
require 'rails_helper'

describe Ability do
	# First, load the seed.rb file in order to initialize default roles
	Rails.application.load_seed

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
