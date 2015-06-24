# require_relative "locationclass.rb"
# require_relative "categoryclass.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"


# Should Create a new owner.
# Should edit owner email.
# Should Delete an owner.
# Should Edit owner name.
# ALl of these methods are defined in database class and instance methods.

class Owner
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :name, :email
 
  # Initializes a new Owner object.
  #
  # id (optional) - Integer of the primary key in the 'owners' table.
  #                         table.
  # name (optional)         - String of the owner's name.
  # email (optional)        - String of the owners's email.

  
  def initialize(owner_options={})
    @id = owner_options["id"]
    @name = owner_options["name"]
    @email = owner_options["email"]
    
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE owners SET name = '#{self.name}', email = '#{self.email}' WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Owner.add({"name" => "#{self.name}", "email" => "#{self.email}")
  end
  # email_valid - if email isn't empty, return true.
  def email_valid(email)
    if !email.empty?
      self.email = email
      return true
    else
      return false
    end
  end
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