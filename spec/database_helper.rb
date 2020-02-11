require 'pg'

def setup_test_database
  connection = PG.connect(dbname: 'passfortWiki')
  connection.exec('TRUNCATE TABLE titles;')
end



