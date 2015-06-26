
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"
require_relative "pet.rb"
require_relative "owner.rb"
require_relative "event.rb"
require_relative "category.rb"
# only admin access of categories
# add, edit and delete.

class PetEvent
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :pet_id, :event_id
 
  # Initializes a new Category object.
  #
  # id (optional) - Integer of the primary key in the 'categories' table.
  #                         table.
  # name (optional)         - String of the category's name.
  
  def initialize(pevent_options={})
    @pet_id = pevent_options["pet_id"]
    @event_id = pevent_options["event_id"]
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE pet_events SET pet_id = '#{self.pet_id}', event_id = '#{self.event_id}', WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    PetEvent.add({"pet_id" => "#{self.pet_id}", "event_id" => "#{self.event_id}"})
  end
 
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
# with pet id, event_id