class AddForumThemeIdToForumTopics < ActiveRecord::Migration
	
	#this will add the id of forum themes to the forum topics table.
	#It is needed to make the association between these models.
	def change
	    add_column :forum_topics, :forum_theme_id, :integer
	   
 	 end
end