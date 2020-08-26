require 'pg'

class Bookmarks

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
    con = PG.connect :dbname => 'bookmark_manager'
    end
    bookmarks = con.exec "SELECT * FROM bookmarks"
    p con.exec "SELECT url FROM bookmarks"
    bookmarks.map { |bookmark| bookmark['title'] }

  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    con.exec "INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}');"
  end


end
