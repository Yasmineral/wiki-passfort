require 'pg'

def connect_to_database
  connection = PG.connect(dbname: 'passfortWiki')
end



