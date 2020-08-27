feature 'Deleting bookmarks' do
    scenario 'select a bookmark to delete' do
        visit '/bookmarks'
        fill_in :url, with: 'http://www.monzo.com'
        fill_in :title, with: 'Monzo'
        click_button 'Add'
        fill_in :delete_title, with: 'Monzo' 
        click_button 'Delete'
        expect(page).to_not have_content 'Monzo'
    end
end 