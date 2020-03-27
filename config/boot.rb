require 'rubygems'
require 'bundler/setup'
require 'sequel'


# Check if all tables have been created
DB = Sequel.connect('sqlite://development.db')

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
