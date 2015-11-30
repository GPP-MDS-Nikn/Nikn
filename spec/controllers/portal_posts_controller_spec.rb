require 'rails_helper'

describe PortalPostsController, :type => :controller do
    before(:each) do
        @ong = create(:ong, email: 'newmail@ongmail.com',
                            name: 'new name',
                            phone: '23456789012',
                            cep: '12345678'
                    )
        @ong.add_role(:admin)
        sign_in @ong
    end

    context 'creating posts' do
        it 'should create a post with valid params' do
            @post_attributes = attributes_for(:portal_post)
            expect{
                post :create, :portal_post => @post_attributes
            }.to change(PortalPost, :count).by(1)
        end

        it 'should not create a post with invalid params' do
            @post_attributes = attributes_for(:portal_post, title: nil)
            expect{
                post :create, :portal_post => @post_attributes
            }.to change(PortalPost, :count).by(0)
        end
    end

    context 'showing posts' do
        it 'should show a post' do
            create_post
            get :show, :id => @post.id
            expect(assigns(:portal_post)).to eq(@post)

        end
    end

    context 'updating posts' do
        it 'should update existing post with valid params' do
            create_post
            @attrs = {title: 'new title'}
            put :update, :id =>@post.id, :portal_post => @attrs
            @post.reload
            expect(@post.title).to eq('new title')
        end

        it 'should not update existing post with invalid params' do
            create_post
            @attrs = {title: nil}
            put :update, :id =>@post.id, :portal_post => @attrs
            @post.reload
            expect(@post.title).to eq('portal_post title')
        end
    end

    context 'deleting posts' do
        it 'should delete existing post from database' do
            create_post
            expect{
                delete :destroy, :id => @post.id
            }.to change(PortalPost, :count).by(-1)
        end
    end

private
    def create_post
        @post = create(:portal_post)
    end
end
