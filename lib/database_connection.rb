require 'pg'

class DatabaseConnection
  attr_reader :database

  def self.setup(db_name)
    @@database = PG.connect :dbname => db_name
  end
end