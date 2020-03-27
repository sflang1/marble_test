require 'rubygems'
require 'bundler/setup'
require 'sequel'


# Check if all tables have been created
DB = Sequel.connect('sqlite://development.db')
DB.run("""
  CREATE TABLE IF NOT EXISTS movies (\n
    id serial PRIMARY KEY,\n
    name VARCHAR(50) NOT NULL,\n
    description VARCHAR(250) NOT NULL,\n
    image_url VARCHAR(250) NOT NULL,\n
    days_presented VARCHAR(40) NOT NULL\n
  );
""")

DB.run("""
  CREATE TABLE IF NOT EXISTS reservations (\n
    id serial PRIMARY KEY,\n
    date TIMESTAMP NOT NULL,\n
    movie_id INTEGER REFERENCES movies(id),\n
    quantity INTEGER NOT NULL\n
  );
""")
