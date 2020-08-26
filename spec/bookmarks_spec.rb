require 'bookmarks'
require 'database_helpers'

describe Bookmarks do

  describe '#.all' do
    it 'returns all bookmarks stored in class' do

      con = PG.connect :dbname => 'bookmark_manager_test'

      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers")
      Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "DestroySoftware")
      Bookmarks.create(url: "http://www.google.com", title: "Google")
     
      bookmarks = Bookmarks.all
     
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#.create' do
    it 'adds a bookmark to database' do
      bookmark = Bookmarks.create( url:'www.monzo.com', title: 'Monzo')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmarks
   # expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.title).to eq 'Monzo'
    expect(bookmark.url).to eq 'www.monzo.com'
    end
  end

end
