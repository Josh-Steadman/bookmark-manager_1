feature 'adding bookmark' do
  scenario 'types url into form and submits' do
    visit '/bookmarks'
    fill_in :url, with: 'http://www.monzo.com'
    fill_in :title, with: 'Monzo'
    click_button 'Add'
    expect(page).to have_content('Monzo')
  end
end
