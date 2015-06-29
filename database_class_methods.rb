require "active_support"
require "active_support/inflector"
# This module will be **extended** in all of my classes. It contains methods
# that will become **class** methods for the class.

module DatabaseClassMethods
  
  # table_name returns class as pluralized to use as table name.
  def table_name
    self.to_s.pluralize.underscore
  end
  
  # Returns results as objects.
  def results_as_objects(results)
    array_of_objects = []

    results.each do |hash|
      array_of_objects << self.new(hash)
    end

    return array_of_objects
  end
  # Return all of the rows for a given table.
  #
  # 
  # Returns an Array of objects.
  def all
    results = CONNECTION.execute("SELECT * FROM #{table_name}")
    results_as_objects(results)
    
  end
  # find - Use this method to find a 
  # product based on the ID in database.
  #
  # record_id- The Integer ID of the row to return.
  #
  #
  #    # Here, I'm using the `find` method from DatabaseClassMethods.
  #    result = Product.find(product_id).first
  #    # {"id" => 1, "name" => "Sumeet", "age" => 500}
  #
  #    
  #  
  # makes new instance of row
  #
  # Returns an object 
  def find(record_id)
    # Figure out the table's name from the class we're calling the method on.
    table_name = self.to_s.pluralize.underscore
    result = CONNECTION.execute("SELECT * FROM #{table_name} WHERE id = #{record_id}").first
    self.new(result)
  end
  # sort - call to database to sort table by column name in descending order.
  #
  # Returns an Array of Objects
  def sort(column_name)
    table_name = self.to_s.pluralize.underscore
    results = CONNECTION.execute("SELECT * FROM #{table_name} ORDER BY #{column_name} DESC;")
    results_as_objects(results)
   
  end
  # sort - call to database to sort table by column name in ascending order.
  #
  # Returns an Array of Objects
  def sort_asc(column_name)
    table_name = self.to_s.pluralize.underscore
    results = CONNECTION.execute("SELECT * FROM #{table_name} ORDER BY #{column_name} ASC;")
    results_as_objects(results)
  end
 
  # where - calls method on class to gather rows that have a specific value in a specific column.
  # 
  # Example Product.where("category_id", 3)
  # => [234343 name: Chair brand: Spring category_id: 3 quantity: 4]
  # 
  # Returns an Array of Objects
 
  def where(column_name, column_id)
    table_name = self.to_s.pluralize.underscore
    results = CONNECTION.execute("SELECT * FROM #{table_name} WHERE #{column_name} = #{column_id};")
    results_as_objects(results)
  end
 
  # Add a new record to the database.
  #
  # Returns an Object.
  def add(options={})
    # Example: {"name" => "Sumeet", "age" => 500}
    
    column_names = options.keys
    values = options.values
    
    column_names_for_sql = column_names.join(", ")
    
    individual_values_for_sql = []
    
    values.each do |value|
      if value.is_a?(String)
        individual_values_for_sql << "'#{value}'"
      else  
        individual_values_for_sql << value
      end  
    end
    values_for_sql = individual_values_for_sql.join(", ")
    CONNECTION.execute("INSERT INTO #{table_name} (#{column_names_for_sql}) VALUES (#{values_for_sql});")

    id = CONNECTION.last_insert_row_id
    options["id"] = id

    self.new(options)
    
  end
end