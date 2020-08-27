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
     
      expect(connection).to receive(:exec).with("SELECT * FROM bookmarks;")
    
      DatabaseConnection.query("SELECT * FROM bookmarks;")
     
    end
  end
  
end