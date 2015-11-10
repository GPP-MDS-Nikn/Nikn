class AdminsController < ApplicationController
    def reports_index
        @forum_posts = ForumPost.all
        @reported_posts = @forum_posts.select { |post| post.reports >= 5 }

        @forum_topics = ForumTopic.all
        @reported_topics = @forum_topics.select { |topic| topic.reports >= 5 }
    end
end
