require 'rails_helper'

describe ForumThemesController, :type => :controller do
  before(:each) do
      @ong = create(:ong)
      @ong.add_role(:admin)
      sign_in @ong
  end
    context 'creating themes' do
        it 'should create themes with valid params' do
            @theme_attrs = attributes_for(:forum_theme)
            expect{
                post :create, :forum_theme => @theme_attrs
            }.to change(ForumTheme, :count).by(1)
        end

        it 'should not create themes with invalid params' do
            @theme_attrs = attributes_for(:forum_theme, title: nil)
            expect{
                post :create, :forum_theme => @theme_attrs
            }.to change(ForumTheme, :count).by(0)
        end
    end

    context 'showing themes' do
        it 'should show existing theme' do
            create_theme
            get :show, :id => @theme.id
            expect(assigns(:forum_theme)).to eq(@theme)
        end
    end

    context 'updating themes' do

        it 'should assign right theme to editing' do
            @theme = create(:forum_theme)
            get :edit, id: @theme.id
            expect(assigns(:forum_theme)).to eq(@theme)
        end

        it 'should update themes with valid params' do
            create_theme
            @theme_attrs = {title: 'new title'}
            put :update, :id => @theme.id, :forum_theme => @theme_attrs
            @theme.reload
            expect(@theme.title).to eq('new title')
        end

        it 'should not update themes with invalid params' do
            create_theme
            @theme_attrs = {title: nil}
            put :update, :id => @theme.id, :forum_theme => @theme_attrs
            @theme.reload
            expect(@theme.title).to eq('theme title')
        end
    end

    context 'deleting themes' do
        it 'should delete existing theme from database' do
            create_theme
            expect{
                delete :destroy, :id => @theme.id
            }.to change(ForumTheme, :count). by(-1)
        end
    end

private
    def create_theme
        @theme = create(:forum_theme)
    end
end
