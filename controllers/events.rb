# events controller

# add event------------------------------------------------------
get "/create_event/:x" do
  @category = Category.find(params["x"])
  erb :"create_event"
end

# edit event -------------------------------------------------


# delete event -------------------------------------------------
