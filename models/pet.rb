# require_relative "locationclass.rb"
require_relative "models/owner.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"


# Create pets (names) for user.
#  Edit pet names.
#  Delete pet names.
#  Fetch all pets for a user.
#  Fetch all events for a given pet.
#  Fetch all pets for a given event.

class Pet
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :name, :owner_id
 
  # Initializes a new Pet object.
  #
  # id (optional) - Integer of the primary key in the 'pets' table.
  #                         table.
  # name (optional)         - String of the pet's name.
  # owner_id (optional)     - Integer of the pet's owner (foreign key) from owners table.

  
  def initialize(pet_options={})
    @id = pet_options["id"]
    @name = pet_options["name"]
    @owner_id = pet_options["owner_id"]
    
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE pets SET name = '#{self.name}', owner_id = '#{self.owner_id}' WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Pet.add({"name" => "#{self.name}", "owner_id" => "#{self.owner_id}"})
  end
  # email_valid - if email isn't empty, return true.
  # owner id should be passed as hidden field. 
  
  # def email_valid(email)
 #    if !email.empty?
 #      self.email = email
 #      return true
 #    else
 #      return false
 #    end
 #  end
  # name_valid - if name isn't empty, return true.
  def name_valid(name)
    if !name.empty?
      self.name = name
      return true
    else 
      return false
    end
  end
end