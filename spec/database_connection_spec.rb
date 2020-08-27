require 'database_connection'

describe DatabaseConnection do

  describe '.setup' do
    it 'setups a connection to the database' do
      database_name = 'bookmark_manager_test'

      connection = DatabaseConnection.setup(database_name)
      expect(connection.status).to eq 0
      expect(connection.db).to eq database_name
    end
  end

  describe '.query' do
    it 'executes the SQL query' do
      
    end
  end
  
end