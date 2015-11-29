require 'rails_helper'

describe ForumTopicsController, :type => :controller do
    context 'creating topics' do

        it 'should build new topic from existing theme' do
            @theme = create(:forum_theme)
            get :new, :forum_theme_id => @theme.id
            expect(assigns(:forum_topic).forum_theme_id).to eq(@theme.id)
        end

        it 'should create topic with valid params' do
            @theme = create(:forum_theme)
            @topic_attributes = FactoryGirl.attributes_for(:forum_topic, :forum_theme_id => @theme)
            expect{(
				post :create, :forum_theme_id => @theme, :forum_topic => @topic_attributes
				)}.to change(ForumTopic, :count).by(1)
        end
        it 'should not create topic with invalid params' do
            @theme = create(:forum_theme)
            @topic_attributes = FactoryGirl.attributes_for(:forum_topic, :forum_theme_id => @theme, title: nil)
            expect{(
				post :create, :forum_theme_id => @theme, :forum_topic => @topic_attributes
				)}.to change(ForumTopic, :count).by(0)
        end
    end

    context 'showing topics' do
        it 'should show existing topic' do
            @topic = create(:forum_topic)
            get :show, id: @topic.id
            expect(assigns(:forum_topic)).to eq(@topic)
        end
    end

    context 'updating topics' do

        it 'should assign right topic to editing' do
            @topic = create(:forum_topic)
            get :edit, id: @topic.id
            expect(assigns(:forum_topic)).to eq(@topic)
        end
        it 'should update existing topic with valid params' do
            @topic = create(:forum_topic)
            @new_attributes = {title: 'new_title'}
            put :update, :id => @topic.id, :forum_topic => @new_attributes
            @topic.reload
            expect(@topic.title).to eq('new_title')
        end

        it 'should not update existing topic with invalid params' do
            @topic = create(:forum_topic)
            @new_attributes = {title: nil}
            put :update, :id => @topic.id, :forum_topic => @new_attributes
            @topic.reload
            expect(@topic.title).to eq('topic title')
        end
    end

    context 'deleting topics' do
        it 'should delete existing topic from database' do
            @topic = create(:forum_topic)
            expect{delete :destroy, :forum_theme_id => @topic.forum_theme_id, :id => @topic.id}.to change(ForumTopic, :count).by(-1)
        end
    end

    context  'reporting topics' do
        it 'should assign right topic to be reported' do
            @topic = create(:forum_topic)
            get :new_report_topic, :id => @topic.id
            expect(assigns(:forum_topic)).to eq(@topic)
        end
    end
        it 'should redirect to report page if captcha is correct (topic)' do
            @topic = create(:forum_topic)
            verify_recaptcha = true
            patch :create_report_topic, :id => @topic.id
            expect(response).to redirect_to(new_report_topic_path)
        end

        it 'should not redirect to report page if captcha isnt correct (topic)' do
            @post = create(:forum_post)
            verify_recaptcha = false
            patch :create_report_post, :id => @post.id
            expect(response).to redirect_to(new_report_post_path)
        end

    context 'reporting posts' do
        it 'should assign right post to be reported' do
            @post = create(:forum_post)
            get :new_report_post, :id => @post.id
            expect(assigns(:forum_post)).to eq(@post)
        end

        it 'should redirect to report page if captcha is correct (post)' do
            @post = create(:forum_post)
            verify_recaptcha = true
            patch :create_report_post, :id => @post.id
            expect(response).to redirect_to(new_report_post_path)
        end

        it 'should redirect to report page if captcha isnt correct (post)' do
            @post = create(:forum_post)
            verify_recaptcha = false
            patch :create_report_post, :id => @post.id
            expect(response).to redirect_to(new_report_post_path)
        end
    end

    context 'reporting posts' do

    end

end
