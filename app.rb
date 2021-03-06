# Empower my program with SQLite.
require "sqlite3"
require "pry"
require "sinatra"
set :bind, '0.0.0.0'
require "sinatra/reloader"

# Inventory tracking system for Fibers Home Store. 
# Empower my program with SQLite.
require "sqlite3"
require "active_support/inflector"
require "active_support/core_ext/array/conversions.rb"
require "active_support/core_ext/date/calculations.rb"
require "sinatra/json"

require_relative "models/assignment.rb"
require_relative "models/link.rb"
require_relative "models/partner.rb"



# Load/create our database for this program in SQlite.
CONNECTION = SQLite3::Database.new("assignments.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS assignments (id INTEGER PRIMARY KEY, name TEXT, description TEXT, github TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS links (id INTEGER PRIMARY KEY, assignment_id INTEGER, link TEXT, type TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS partners (id INTEGER PRIMARY KEY, assignment_id INTEGER, name_worked TEXT);")

# Get results as an Array of Hashes.
CONNECTION.results_as_hash = true



#___________________________________________________________________________________________________________

require_relative "controllers/assignments.rb"
require_relative "controllers/api_controller.rb"





