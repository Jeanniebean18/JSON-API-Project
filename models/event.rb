# require_relative "locationclass.rb"
require_relative "owner.rb"
require_relative "category.rb"
require_relative "pet.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"

class Event
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id, :category_id
  attr_accessor :name, :date, :reminder_time, :comment
 
  # Initializes a new Event object.
  #
  # id   - Integer of the primary key in the 'events' table.
  #                         table.
  # name   - String of the event's name.
  # date  - Integer of the event's date 
  #
  # category_id - Integer of category_id (foreign key) from categories table.
  #
  # reminder_time - Integer of the event's date + increment chosen = reminder_time.
  #
  # comment - String of owner's comment.
 
  
  def initialize(event_options={})
    @id = event_options["id"]
    @name = event_options["name"]
    @date = event_options["date"]
    @category_id = event_options["category_id"]
    @reminder_time = event_options["reminder_time"]
    @comment = event_options["comment"]
    
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE events SET name = '#{self.name}', date = '#{self.date}', category_id = #{self.category_id}, reminder_time = '#{self.reminder_time}', comment = '#{self.comment}' WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Event.add({"name" => "#{self.name}", "date" => "#{self.date}", "category_id" => "#{self.category_id}", "reminder_time" => "#{self.reminder_time}", "comment" => "#{self.comment}"})
    id = CONNECTION.last_insert_row_id
    return id
  end
  # Method uses join to combine events, pets and pet_events table.
  def self.event_details
    results = CONNECTION.execute("SELECT pets.name, pets.id AS pet, events.id, events.name, events.date, events.reminder_time, events.category_id, events.comment FROM events JOIN pet_events ON events.id = pet_events.event_id LEFT JOIN pets ON pets.id = pet_events.pet_id;")
  end
  
  # Takes date of event and reminder_time chosen by user.
  # increments date to reminder_time
  # Returns incremented date.
  def increment_date(date, reminder_time)
    @formatted_date = date.gsub(/-/, ', ').to_i
    new_date = Date.new(@formatted_date)
    new_date.advance(days: reminder_time) # => Wed, 04 Aug 2010
  end
end