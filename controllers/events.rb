# events controller

# add event------------------------------------------------------
get "/create_event/:x/:y" do
  @category = Category.find(params[:x])
  @owner = Owner.find(params[:y])
  erb :"create_event"
end

get "/save_event" do
  @event = Event.new({"name" => params["name"], "date" => params["date"], "category_id" => params["category_id"], "reminder_time" => params["reminder_time"], "comment" => params["comment"]})
  event = @event.add_to_database
  @string = []
  @pet_ids = params["pets"]
  @pet_ids.each do |row|
    @pet = Pet.find(row.to_i)
    @string << @pet.name
    @pet_event = PetEvent.new("pet_id" => row, "event_id" => event)
    @pet_event.add_to_database
  end

  erb :"save_event_success"
end

get "/event_details" do
  @petsandevents = Event.event_details
  erb :"event_details"
end

get "/show_events" do
  erb :"show_events"
end

get "/delete_event/:x" do
  @event = Event.find(params[:x])
  @event.delete
  "event deleted."
end

# edit event -------------------------------------------------


# delete event -------------------------------------------------
# don' think you need this because the pet is the id. Should return an array of 
# @pet = Pet.find(pet)