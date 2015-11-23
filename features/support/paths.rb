module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  # When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
  case page_name

  when /^root page$/
      '/'
#Ong login
  when /^sign_in page$/
      '/ongs/sign_in'

  when /^sign_up page$/
      '/ongs/sign_up'

  when /^ong page$/
      '/ongs'

#Forum_Themes
  when /^forum_themes page$/
      '/forum_themes'

  when /^new_theme page$/
      '/forum_themes/new'

  when /^edit_theme page$/
      '/forum_themes/1/edit'

  when /^show_theme page$/
      '/forum_themes/1'

#Forum_Topics
  when /^new_topic page$/
      '/forum_themes/1/forum_topics/new'

  when /^edit_topic page$/
      '/forum_topics/1/edit'

  when /^show_topic page$/
      '/forum_topics/1'

#Forum_Post
  when /^edit_post page$/
      '/forum_topics/1/forum_posts/1/edit'

  when /^report_post page$/
      '/forum_topics/1/new_report_post'

#Event
  when /^events page$/
      '/events'

  when /^new_event page$/
      '/events'




  # Add more mappings here.
  # Here is an example that pulls values out of the Regexp:
  #
  # when /^(.)'s profile page$/i
  # user_profile_path(User.find_by_login($1))

  else
  begin
  page_name =~ /^the (.) page$/
  path_components = $1.split(/\s+/)
  self.send(path_components.push('path').join('_').to_sym)
  rescue NoMethodError, ArgumentError
  raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
  "Now, go and add a mapping in #{__FILE__}"
  end
  end
  end
end

World(NavigationHelpers)
