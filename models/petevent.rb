
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
  attr_reader :id
  attr_accessor :name
 
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
    CONNECTION.execute("UPDATE categories SET name = '#{self.name}' WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Category.add({"name" => "#{self.name}"})
  end
 
end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  # params["pets"].each do |pet|
 #    @pet = Pet.find(pet)
 #    @pet_event = PetEvent.new(@pet.id, @event.id )
 #    @pet_event.add_to_database
 #  end
  
# with pet id, event_id