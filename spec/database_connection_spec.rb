require 'database_connection'

describe DatabaseConnection do
    database_name = 'bookmark_manager_test'
    let(:connection) { DatabaseConnection.setup(database_name) }

  describe '.setup' do
    it 'setups a connection to the database' do
      
      expect(connection.status).to eq 0
      expect(connection.db).to eq database_name
    end
  end

  describe '.query' do
    it 'executes the SQL query' do
      sql_string = "INSERT INTO bookmarks (url, title) VALUES ('www.google.com', 'Google');"
      query = connection.query(sql_string)
      expect(query.first.title).to eq "Google"
    end
  end
  
end