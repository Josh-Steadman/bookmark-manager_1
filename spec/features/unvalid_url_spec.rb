feature 'unvalid url' do
    scenario 'user types in a unvalid url' do
        visit('/bookmarks')
        fill_in :title, with: 'Test'
        fill_in :url, with: 'www.test.com'
        click_button 'Add'
        expect(page).to_not have_content 'Test'
        expect(page).to have_content 'unvalid url'
    end
end