require 'rails_helper'

describe ForumThemesController, :type => :controller do
    context 'creating themes' do
        it 'should create themes with valid params' do
            expect {@theme = create_theme}.to change(ForumTheme, :count).by(1)
        end

        it 'should not create themes with invalid params' do
            expect {@theme = create_theme(title: nil)}.to change(ForumTheme, :count).by(0)
        end
    end
    context 'updating themes' do
        it 'should update themes with valid params' do
            @theme = create_theme
            update_theme(@theme)
            expect(@theme.title).to eq("new title")
        end

#        it 'should not update themes with invalid params' do
#            @theme = create_theme
#            update_theme(@theme, title: 'a')
#            expect(@theme.title).to eq("title")
#        end
    end

    context 'deleting themes' do
        it 'should delete existing theme from database' do
            @theme = create_theme
            expect {@theme.destroy}.to change(ForumTheme, :count).by(-1)
        end
    end

private
    def create_theme(options={})
        ForumTheme.create({
            title: "title",
            description: "description"
        }.merge(options))
    end

    def update_theme(theme, options={})
        theme.update({
            title: "new title",
            description: "new description"}.merge(options)
        )
        theme.save
    end

end
