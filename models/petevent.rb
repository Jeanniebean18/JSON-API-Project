
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
  
  attr_accessor :pet_id, :owner_id
 
  # Initializes a new Category object.
  #
  # id (optional) - Integer of the primary key in the 'categories' table.
  #                         table.
  # name (optional)         - String of the category's name.
  
  def initialize(category_options={})
    @id = category_options["id"]
    @name = category_options["name"]
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE petevents SET pet_id = '#{self.pet_id}', event_id = '#{self.event_id}', WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    PetEvent.add({"name" => "#{self.pet_id}"} "name" => "#{self.event_id}"})
  end
 
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
# with pet id, event_id