require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PortalPostsController, :type => :controller do

	context "http response" do
		before(:each) do
			@enterprise_portal_post = PortalPost.create(portal_post_params) # Valid portal_post
			@enterprise_portal_post.save
		end

		describe 'GET index' do
			it "should work" do
				get :index
				expect(response).to have_http_status(:success)
			end
		end

		describe 'GET show' do
			it "should work" do
				get :show, id: @enterprise_portal_post.id
				expect(response).to have_http_status(:success)
			end
		end

		describe 'GET edit' do
			it "should work" do
				get :edit, id: @enterprise_portal_post.id
				expect(response).to have_http_status(:success)
			end
		end

		describe 'GET new' do
			it "should work" do
				get :new
				expect(response).to have_http_status(:success)
			end
		end

		describe 'POST create' do
			it "should work" do
				post :create, portal_post: portal_post_params
				expect(response).to have_http_status(:redirect)
			end
		end

		describe 'PUT update' do
			it "should work" do
				put :update, id: @enterprise_portal_post.id, portal_post: { 
					title: "there is a new title here" }
				expect(response).to have_http_status(:redirect)
			end
		end

		describe 'DELETE destroy' do
			it "should work" do
				delete :destroy, id: @enterprise_portal_post.id
				expect(response).to have_http_status(:redirect)
			end
		end

	end

	context 'creating with valid params' do
		it "saves portal_post" do
			expect{(
				post :create, portal_post: portal_post_params
				)}.to change(PortalPost, :count).by(1)
		end

		it "redirects to the portal_post's page" do
				post :create, portal_post: portal_post_params
				expect(response).to redirect_to (portal_posts_path + "/1")
		end
	end

	context 'try to create with invalid attributes' do
		it "does not save portal_post" do
			expect{(
				post :create, portal_post: portal_post_params(author: nil)
				)}.not_to change(PortalPost, :count)
		end
	end

	context 'template rendering' do
		it "renders the template index" do
			get :index
			expect(response).to render_template("index")
		end

		it "renders the template new" do
			get :new
			expect(response).to render_template("new")
		end
	end

	context "route" do
		it "routes GET index" do
			expect(get: "portal_posts").to route_to(
				controller: "portal_posts",
				action: "index")
		end

		it "routes GET new" do
			expect(get: "portal_posts/new").to route_to(
				controller: "portal_posts",
				action: "new")
		end

		it "routes GET show" do
			expect(get: "portal_posts/1").to route_to(
				controller: "portal_posts", 
				action: "show", 
				id: "1")
		end
		
		it "routes GET edit" do 
			expect(get: "portal_posts/1/edit").to route_to(
				controller: "portal_posts",
				action: "edit",
				id: "1")
		end

		it "routes POST create" do
			expect(post: "portal_posts").to route_to(
				controller: "portal_posts",
				action: "create")
		end

		it "routes PUT update" do
			expect(put: "portal_posts/1").to route_to(
				controller: "portal_posts",
				action: "update",
				id: "1")
		end

		it "routes DELETE destroy" do
			expect(delete: "portal_posts/1").to route_to(
				controller: "portal_posts",
				action: "destroy",
				id: "1")
		end
	end
	
	private
		# Default settings to test.
		# Only valid fields.
		def portal_post_params(options={})
			return ({
				author: "here comes the author",
				title: "that's the title",
				body: "and finally the body"
			}.merge(options))
		end
end
