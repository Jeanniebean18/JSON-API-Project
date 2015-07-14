
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"
require_relative "assignment.rb"
require_relative "partner.rb"

# only admin access of categories
# add, edit and delete.

class Assignment
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :name, :description, :github
  
  # (id INTEGER PRIMARY KEY, name TEXT, description TEXT, github TEXT, )")
  
 
  # Initializes a new Assignment object.
  #
  # id (optional) - Integer of the primary key in the 'assignments' table.
  #                         table.
  # name (optional)         - String of the assignments's name.
  # description (optional)  - String of the assignments's description.
  # github (optional)  - String of the assignments's github link.
  
  def initialize(assignment_options={})
    @id = assignment_options["id"]
    @name = assignment_options["name"]
    @description = assignment_options["description"]
    @github = assignment_options["github"]
  end
  # // returns hash of hashes of all assignments
  def self.hash_objects
    @assignments_hash = {}
    Assignment.all.each do |assignment|
      @assignments_hash[:id] = assignment.id
      @assignments_hash[:assignment_name] = assignment.name
      @assignments_hash[:description] = assignment.description
      @assignments_hash[:github] = assignment.github
      @partners = Partner.find_partner(assignment.id)
      @assignments_hash[:partners] = @partners
      @links = Link.find_link(assignment.id)
      @assignments_hash[:links] = @links
    end
    return @assignments_hash
  end
  # // return single hash object of given assignment id
  def self.hash_object(record_id)
    assignment = Assignment.find(record_id)
    @assignment_hash = {}
    @assignment_hash[:id] = assignment.id
    @assignment_hash[:assignment_name] = assignment.name
    @assignment_hash[:description] = assignment.description
    @assignment_hash[:github] = assignment.github
    @partner = Partner.find_partner(assignment.id)
    @assignment_hash[:partners] = @partners
    @links = Link.find_link(assignment.id)
    @assignment_hash[:links] = @links
    return @assignment_hash
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE assignments SET name = '#{self.name}', description = '#{self.description}', github = '#{self.github}', WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Assignment.add({"name" => "#{self.name}", "description" => "#{self.description}", "github" => "#{self.github}"})
    id = CONNECTION.last_insert_row_id
    return id
  end
 
end