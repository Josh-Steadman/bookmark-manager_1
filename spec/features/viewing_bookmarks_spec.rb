require 'pg'
feature 'viewing bookmarks' do
  scenario 'visiting index page' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end

  scenario 'A user can  see bookmarks' do
    Bookmarks.create(url: "http://www.makersacademy.com", title: 'Makers')
    Bookmarks.create(url: "http://www.destroyallsoftware.com", title: 'DestroySoftware')
    Bookmarks.create(url: "http://www.google.com", title: 'Google')

    visit '/bookmarks'
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end
