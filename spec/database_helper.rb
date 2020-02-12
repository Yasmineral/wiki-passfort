require 'pg'

def connect_to_database
  PG.connect(dbname: 'passfortWiki')
end
