
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"
require_relative "assignment.rb"
require_relative "link.rb"


class Partner
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :assignment_id, :name_worked
  
 
  # Initializes a new Partner object.
  #
  # id (optional) - Integer of the primary key in the 'assignments' table.
  #                         table.
  # assignment_id (optional)         - Integer of assignment id (foreign key)
  # name_worked - String of name of person that worked on assignment.
  
  def initialize(partner_options={})
    @id = partner_options["id"]
    @assignment_id = partner_options["assignment_id"]
    @name_worked = partner_options["name_worked"]
  end
  
  def results_as_objects(results)
    array_of_objects = []
    results.each do |hash|
      array_of_objects << self.new(hash)
    end
    return array_of_objects
  end
  
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE partners SET assignment_id = '#{self.assignment_id}', name_worked = '#{self.name_worked}', WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Partner.add({"assignment_id" => "#{self.assignment_id}", "name_worked" => "#{self.name_worked}"})
  end
  
  def self.find_partner(record_id)
    # Figure out the table's name from the class we're calling the method on.
    results = CONNECTION.execute("SELECT * FROM partners WHERE assignment_id = #{record_id}")
  end
 
end