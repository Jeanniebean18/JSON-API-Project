# require_relative "locationclass.rb"
require_relative "owner.rb"
require_relative "category.rb"
require_relative "pet.rb"
require_relative "../database_class_methods.rb"
require_relative "../database_instance_methods.rb"



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
    Event.add({"name" => "#{self.name}", "date" => "#{self.date}", "category_id" => "#{self.category_id}", "reminder_time" => "#{self.reminder_time}", "comment" => "#{self.comment}"})
    id = CONNECTION.last_insert_row_id
    return id
  end
  def self.event_details
  results = CONNECTION.execute("SELECT pets.name, pets.id, events.name, events.date FROM events JOIN pet_events ON events.id = pet_events.event_id LEFT JOIN pets ON pets.id = pet_events.pet_id;")
end
  
  # 
  # TODO write a method that adds the incremented time to the date.
  # need to add pets to pets_events table. 
 
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
  # # name_valid - if name isn't empty, return true.
  #  def name_valid(name)
  #    if !name.empty?
  #      self.name = name
  #      return true
  #    else
  #      return false
  #    end
  #  end
  
  # <!-- <%=@petevents = PetEvent.where("pet_id", pet.id)%>
  # <%=@petevents.each do |event| %>
  # <%=event.name%>
  #  <% end %>
  # <!-- <%=@petevents = PetEvent.where("pet_id", pet.id)%>
 #   <!-- <% end %> --> -->
end