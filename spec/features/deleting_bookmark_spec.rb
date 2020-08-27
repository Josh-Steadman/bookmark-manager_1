feature 'Deleting bookmarks' do
    scenario 'select a bookmark to delete' do
        Bookmarks.create(url: 'http://www.monzo.com', title: 'Monzo')
        visit('/bookmarks')
        expect(page).to have_link('Monzo', href: 'http://www.monzo.com')
        first('.bookmark').click_button 'Delete'

        expect(current_path).to eq '/bookmarks'
        expect(page).not_to have_link('Monzo', href: 'http://www.monzo.com')
        
    end
end 