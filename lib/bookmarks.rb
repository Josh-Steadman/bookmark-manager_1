require 'pg'

class Bookmarks

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id  = id
    @title = title
    @url = url
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
    con = PG.connect :dbname => 'bookmark_manager'
    end
    bookmarks = con.exec("SELECT * FROM bookmarks")
  bookmarks.map do |bookmark|
    Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
  end

  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect :dbname => 'bookmark_manager_test'
    else
      con = PG.connect :dbname => 'bookmark_manager'
    end
    bookmarks = con.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title;")
    Bookmarks.new(id: bookmarks[0]['id'], title: bookmarks[0]['title'], url: bookmarks[0]['url'])
  end


end
