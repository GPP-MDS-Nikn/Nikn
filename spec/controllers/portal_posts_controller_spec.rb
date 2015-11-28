require 'rails_helper'

describe PortalPostsController, :type => :controller do
    context 'creating posts' do
        it 'should create a post with valid params' do
            expect {@post = create_portal_post}.to change(PortalPost, :count).by(1)

        end

        it 'should not create a post with invalid params' do
            expect {@post = create_portal_post(author: nil)}.to change(PortalPost, :count).by(0)

        end
    end

    context 'deleting posts' do
        it 'should delete existing post from database' do
            @post = create_portal_post
            expect {@post.destroy}.to change(PortalPost, :count).by(-1)
        end
    end

    context 'updating posts' do
        it 'should update fields in posts' do
            @post = create_portal_post
            update_portal_post(@post)
            expect(@post.author).to eq("new author")
        end
    end

private
    def create_portal_post(options={})
        PortalPost.create({
            author: "author",
            title: "title",
            body: "body"
        }.merge(options))
    end

    def update_portal_post(post)
        post.update(
            author: "new author",
            title: "new title",
            body: "new body"
        )
    end
end
