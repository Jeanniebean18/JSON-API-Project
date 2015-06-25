# require_relative "locationclass.rb"
require_relative "owner.rb"
require_relative "category.rb"
require_relative "pet.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"


# name Text
# date 
# category_id foreign key
# reminder date
# comment

class Event
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  attr_reader :id, :category_id
  attr_accessor :name, :date, :reminder_time, :comment
 
  # Initializes a new Pet object.
  #
  # id   - Integer of the primary key in the 'events' table.
  #                         table.
  # name   - String of the event's name.
  # date  - Integer of the event's date 
  #
  # category_id - Integer of category_id (foreign key) from categories table.
  #
  # reminder_time - Integer of the event's date + increment chosen = reminder_time.
  #
  # comment - String of owner's comment.
 
  
  def initialize(event_options={})
    @id = event_options["id"]
    @name = event_options["name"]
    @date = event_options["date"]
    @category_id = event_options["category_id"]
    @reminder_time = event_options["reminder_time"]
    @comment = event_options["comment"]
    
  end
  # save row to database. 
  def save
    CONNECTION.execute("UPDATE events SET name = '#{self.name}', date = '#{self.date}', category_id = #{self.category_id}, reminder_time = '#{self.reminder_time}', comment = '#{self.comment}' WHERE id = #{self.id};")
  end
  # instance method adds object attributes to database as a row.
  def add_to_database
    event.add({"name" => "#{self.name}", "date" => "#{self.owner_id}", "category_id" => "#{self.category_id}", "reminder_time" => "#{self.reminder_time}", "comment" => "#{self.comment}"})
  end
  # 
  # TODO write a method that adds the incremented time to the date.
  
  # select from pets where owner_id = owner.id
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