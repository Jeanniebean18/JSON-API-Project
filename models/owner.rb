# require_relative "locationclass.rb"
# require_relative "categoryclass.rb"
require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"


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
 
end

  
