class AdminsController < ApplicationController
    def index_reports
        @forum_posts = ForumPost.all
        @reported_posts = @forum_posts.select { |post| post.reports >= 5 }
    end
end
