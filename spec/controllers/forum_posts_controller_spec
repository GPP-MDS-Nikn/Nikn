require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ForumPostsController, :type => :controller do

	context "http response" do
		before(:each) do
			@enterprise_forum_post = ForumPost.create(some_params) # Valid event
			@enterprise_forum_post.save
		end

		describe 'GET index' do
			it "should work" do
				get :index
				expect(response).to have_http_status(:success)
			end
		end

		describe 'GET show' do
			it "should work" do
				get :show, id: @enterprise_forum_post.id
				expect(response).to have_http_status(:success)
			end
		end

		describe 'GET edit' do
			it "should work" do
				get :edit, id: @enterprise_forum_post.id
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
				post :create, forum_post: some_params
				expect(response).to have_http_status(:redirect)
			end
		end

		describe 'PUT update' do
			it "should work" do
				put :update, id: @enterprise_forum_post.id, forum_post: {
					title: "a" * ForumPost::TITLE_MIN_LENGTH } # Valid title
				expect(response).to have_http_status(:redirect)
			end
		end

		describe 'DELETE destroy' do
			it "should work" do
				delete :destroy, id: @enterprise_forum_post.id
				expect(response).to have_http_status(:redirect)
			end
		end

	end

	context 'creating with valid params' do
		it "saves event" do
			expect{(
				post :create, forum_post: some_params
				)}.to change(ForumPost, :count).by(1)
		end

		it "redirects to the event's page" do
				post :create, forum_post: some_params
				expect(response).to redirect_to (events_path + "/1")
		end
	end

	context 'try to create with invalid attributes' do
		it "does not save event" do
			expect{(
				post :create, forum_post: some_params(title: "a" * (ForumPost::TITLE_MIN_LENGTH - 1))
				)}.not_to change(ForumPost, :count)
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
		it "routes get index" do
			expect(get: "forum_posts").to route_to(
				controller: "forum_posts",
				action: "index")
		end

		it "routes get new" do
			expect(get: "forum_posts/new").to route_to(
				controller: "forum_posts",
				action: "new")
		end

		it "routes get show" do
			expect(get: "forum_posts/1").to route_to(
				controller: "forum_posts",
				action: "show",
				id: "1")
		end

		it "routes get edit" do
			expect(get: "forum_posts/1/edit").to route_to(
				controller: "forum_posts",
				action: "edit",
				id: "1")
		end

		it "routes post create" do
			expect(post: "forum_posts").to route_to(
				controller: "forum_posts",
				action: "create")
		end

		it "routes put update" do
			expect(put: "forum_posts/1").to route_to(
				controller: "forum_posts",
				action: "update",
				id: "1")
		end

		it "routes delete destroy" do
			expect(delete: "forum_posts/1").to route_to(
				controller: "forum_posts",
				action: "destroy",
				id: "1")
		end
	end

	private
		# Default settings to test.
		# Only valid fields.
		def some_params(options={})
			return ({
				title: "Forum post title sample",
        content: "Forum post content sample"
			}.merge(options))
		end
end
