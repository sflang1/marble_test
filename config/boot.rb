require 'rubygems'
require 'bundler/setup'
require 'sequel'

DB = Sequel.connect(ENV['DATABASE_URL'] || 'sqlite://development.db')

# Check if all tables have been created
if ENV['DATABASE_URL']
  #postgres creation
  DB.run("""
    CREATE TABLE IF NOT EXISTS movies (\n
      id INTEGER PRIMARY KEY AUTOINCREMENT,\n
      name TEXT NOT NULL,\n
      description TEXT NOT NULL,\n
      image_url TEXT NOT NULL,\n
      days_presented TEXT NOT NULL\n
    );
  """)

  DB.run("""
    CREATE TABLE IF NOT EXISTS reservations (\n
      id INTEGER PRIMARY KEY AUTOINCREMENT,\n
      date INTEGER NOT NULL,\n
      movie_id INTEGER,\n
      FOREIGN KEY (movie_id)
        REFERENCES movies(id)
    );
  """)
else
  #sqlite creation
  DB.run("""
    CREATE TABLE IF NOT EXISTS movies (\n
      id INTEGER PRIMARY KEY AUTOINCREMENT,\n
      name TEXT NOT NULL,\n
      description TEXT NOT NULL,\n
      image_url TEXT NOT NULL,\n
      days_presented TEXT NOT NULL\n
    );
  """)

  DB.run("""
    CREATE TABLE IF NOT EXISTS reservations (\n
      id INTEGER PRIMARY KEY AUTOINCREMENT,\n
      date INTEGER NOT NULL,\n
      movie_id INTEGER,\n
      FOREIGN KEY (movie_id)
        REFERENCES movies(id)
    );
  """)
end
