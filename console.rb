require 'pg'
require 'pry'

def run_sql(sql, sql_params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'character_bank_db'})
    results = db.exec_params(sql, sql_params)
    db.close
    results
end

binding.pry