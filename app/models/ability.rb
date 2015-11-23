class Ability
	include CanCan::Ability

	def initialize(user)
		# If the user parameter is not passed, initialize it as a guest user (not logged in)	
		user ||= Ong.new
		
		if user.has_role? :admin
			can :manage, [ForumTheme, ForumTopic, ForumPost, Event, PortalPost, MortalityRate]
		
		elsif user.has_role? :ong
			can :manage, [ForumTopic, Event, PortalPost], :ong_id => user.id
			can :create, [ForumTopic, Event, PortalPost]
		end

		can :create, ForumPost
		can :read, [ForumTheme, ForumTopic, ForumPost, Event, PortalPost, MortalityRate]
	end

end
