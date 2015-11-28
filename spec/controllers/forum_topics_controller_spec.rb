require 'rails_helper'

describe ForumTopicsController, :type => :controller do
    context 'creating topics' do
        it 'should create topic with valid params' do
            @theme = create(:forum_theme)
            @topic_attributes = FactoryGirl.attributes_for(:forum_topic, :forum_theme_id => @theme)
            expect{(
				post :create, :forum_theme_id => @theme, :forum_topic => @topic_attributes
				)}.to change(ForumTopic, :count).by(1)
    #        expect{create_topic}.to change(ForumTopic, :count).by(1)
        end
        it 'should not create topic with invalid params' do
            expect{create_topic(title: nil)}.to change(ForumTopic, :count).by(0)
        end

        it 'initializes with 0 reports' do
            @topic = create_topic
            expect(@topic.reports).to eq(0)
        end
    end
    describe 'PUT #update' do
    #context 'updating topics' do
        it 'should update existing topic' do
            @topic = create_topic
            update_topic(@topic)
            expect(@topic.title).to eq('new title')
        end
    end

    context 'deleting topics' do
        it 'should delete existing topic from database' do
            @topic = create_topic
            expect{@topic.destroy}.to change(ForumTopic, :count).by(-1)
        end
    end


private
    def create_topic(options={})
        ForumTopic.create({
            title: 'title',
            body: 'body'
        }.merge(options))
    end

    def create_theme(options={})
        ForumTheme.create({
            title: 'title',
            description: 'description'
        }.merge(options))

    end

    def update_topic(topic)
        topic.update(
            title: 'new title',
            body: 'new body'
        )
    end

    def some_params(options={})
        return ({
            title: "Event's name",
            body: 'body'
        }.merge(options))
    end


end
