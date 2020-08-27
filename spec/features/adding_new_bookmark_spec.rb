feature 'adding bookmark' do
  scenario 'types url into form and submits' do
    visit '/bookmarks'
    fill_in :title, with: 'Test'
    fill_in :url, with: 'www.test.com'
    click_button 'Add'
    expect(page).to have_content('www.test.com')

  end
end
