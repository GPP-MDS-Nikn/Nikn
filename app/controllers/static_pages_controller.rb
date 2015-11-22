class StaticPagesController < ApplicationController

  MINIMUM_LIMIT_FOR_THE_LAST_POSTS_QUANTITY = 3
  MINIMUM_POSTS_GROUP_SIZE = 2

  # By default it should not be considered a static page,
  # but it was in the first version of the site layout,
  # so we decided that is more readable to take it here.
  def home
    # Class variables for increase maintainability
    @@quantity_of_posts = 9 # Quantity of posts there will appear in the home page
    @@posts_group_size = 3  # How many posts will appear per slice of posts in the home page

    ungrouped_last_posts = get_last_posts(@@quantity_of_posts)
    @grouped_last_posts = create_list_groups(ungrouped_last_posts, @@posts_group_size)
  end

  def about
  end

  def contact
  end

  def opendata
  end

  private
    # Method to get the last posts
    def get_last_posts(quantity = MINIMUM_LIMIT_FOR_THE_LAST_POST_QUANTITY)
      return PortalPost.order(created_at: :desc).limit(quantity)
    end

    # Method to get a list of lists grouped by specified number of elements
    def create_list_groups(list_of_elements, group_size = MINIMUM_GROUP_SIZE)
      grouped_elements = []
      list_of_elements.each_slice(group_size) do |each|
        grouped_elements << each
      end

      return grouped_elements
    end
end
