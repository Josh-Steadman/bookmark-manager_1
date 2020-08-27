require 'pg'

class DatabaseConnection
  

  def self.setup(db_name)
    @database = PG.connect :dbname => db_name
    
  end

  def self.query(sql_query)
   @database.exec(sql_query)
   
  end
  
  

end