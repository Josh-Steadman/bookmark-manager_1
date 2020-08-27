
feature 'updating bookmark' do
    scenario 'select a bookmark to update' do
        Bookmarks.create(url: 'http://www.tast.com', title: 'Tast')
        visit('/bookmarks')
        expect(page).to have_link('Tast', href: 'http://www.tast.com')

        click_button 'Update'
        expect(current_path).to eq '/bookmarks/1/update' 
        
        fill_in 'url', with: 'http://www.test.com'
        fill_in 'title', with: 'Test'
        click_button 'Submit'
        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('Tast', href: 'http://www.tast.com')
        expect(page).to have_link('Test', href: 'http://www.test.com')
    end
end


