require "active_support"
require "active_support/inflector"
require_relative "database_class_methods.rb"


# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.

module DatabaseInstanceMethods
  extend DatabaseClassMethods

  # delete - deleted entire row of object in table according to saved ID in instance.
  # 
  # Returns nil because row is deleted. 
  # instance method.
  def delete
    # Figure out the table's name from the object we're calling the method on.
    table_name = self.class.to_s.pluralize.underscore
    CONNECTION.execute("DELETE FROM #{table_name} WHERE id = #{@id};") # need to see if this one will work, if not look up.
  end
  
  def s_to_i_array(array)
    array.chomp.split(',').map { |x| x.to_i }
  end
  
  def name_valid(name)
    if !name.empty?
      self.name = name
      return true
    else
      return false
    end
  end
  
  def email_valid(email)
    if !email.empty?
      self.email = email
      return true
    else
      return false
    end
  end

end