# events controller

# add event------------------------------------------------------
get "/create_event/:x" do
  @category = Category.find(params["x"])
  erb :"create_event"
end

get "save_event" do
  @event = Event.new({"name" => params["name"], "date" => params["date"], "category_id" => params["category_id"], "reminder_time" => params["reminder_time"], "comment" => params["comment"]})
  @event.add_to_database
      erb :"add_owner_success"
end

# edit event -------------------------------------------------


# delete event -------------------------------------------------
