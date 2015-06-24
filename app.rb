# Empower my program with SQLite.
require "sqlite3"
require "pry"
require "sinatra"
require "sinatra/reloader"
# Inventory tracking system for Fibers Home Store. 
# Empower my program with SQLite.
require "sqlite3"
require "active_support/inflector"

require_relative "models/owner.rb"


# Load/create our database for this program in SQlite.
CONNECTION = SQLite3::Database.new("pet_tracker.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS owners (id INTEGER PRIMARY KEY, name TEXT, email TEXT)")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS pets (id INTEGER PRIMARY KEY, name TEXT, owner_id INTEGER);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS events (id INTEGER PRIMARY KEY, name TEXT, date TEXT,
category_id INTEGER, reminder_time TEXT, comment TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS categories (id INTEGER PRIMARY KEY, name TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS pets_and_events (pet_id INTEGER, event_id INTEGER);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true



#___________________________________________________________________________________________________________

require_relative "controllers/owners.rb"



     



