require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"
require_relative "assignment.rb"
require_relative "partner.rb"

# (id INTEGER PRIMARY KEY, assignment_id INTEGER, link TEXT, type TEXT)
class Link
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id
  attr_accessor :assignment_id, :link, :type
  
  # (id INTEGER PRIMARY KEY, name TEXT, description TEXT, github TEXT, )")
  
 
  # Initializes a new Link object.
  #
  # id (optional) - Integer of the primary key in the 'assignments' table.
  #                         table.
  # assignment_id (optional)         - Integer of assignment id (foreign key)
  # link (optional)  - String of the link
  # type (optional)  - String of the links's type (article or video)
  
  def initialize(link_options={})
    @id = link_options["id"]
    @assignment_id = link_options["assignment_id"] 
    @link = link_options["link"]
    @type = link_options["type"]
  end
  
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE links SET assignment_id = '#{self.assignment_id}', link = '#{self.link}', type = '#{self.type}', WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    Link.add({"assignment_id" => "#{self.assignment_id}", "link" => "#{self.link}", "type" => "#{self.type}"})
  end
  
  def self.find_link(record_id)
    # Figure out the table's name from the class we're calling the method on.
    result = CONNECTION.execute("SELECT * FROM links WHERE assignment_id = #{record_id}")
    
  end
 
end