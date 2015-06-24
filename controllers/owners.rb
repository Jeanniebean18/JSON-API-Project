# add owner------------------------------------------------------

get "/add_owner" do
  erb :add_owner
end
get "/save_owner" do
  if params["name"].empty? 
    # Unsuccessful edit page.
    @error = true
    erb :"add_owner"
  elsif params["email"].empty? 
    # Unsuccessful edit page.
    @error = true
    erb :"add_owner"
  else 
    Owner.add({"name" => params["name"], "email" => params["email"]})
    # Successful edit page.
    erb :"add_owner_success"
    # take them to menu to see their pets, if they don't have any pets. ask them to add some. 
  end
end
# delete owner -------------------------------------------------
get "/delete_owner_form" do
  erb :"delete_owner"
end

get "/delete_owner" do
  @owner = Owner.find(params["id"])
  if params["decision"] == "yes"
    @owner.delete
    "deleted." # make erb for this.
  else
    "not deleted." # make erb for this.
    # erb :"delete_success"
  end
end
# select existing owner------------------------------------------
get "/existing_owner" do
  erb :existing_owner
end

get "/see_profile/:x" do
  @owner = Owner.find(params["x"])
  # find pets where owner id = x
  erb :"see_profile"
end

# add the edit user details to this page. #must be able to add new values to objects and then save as a whole at the end. 

# take them to page to see their pets and if they don't have any pets, prompt them to add one. 

#/edit profile --------------------------------------------------


get "/edit_profile/:x" do
  @owner = Owner.find(params["x"])
  erb :"edit_profile"
end
  # edit form
  # hidden field to pass id
  
get "/save_profile" do
  @owner = Owner.find(params["id"])
  if params["name"].empty?
    @error = true
    erb :"edit_profile"
    
  elsif params["email"].empty?
      @error = true
      erb :"edit_profile"
  else
    @owner.name = params["name"]
    @owner.email = params["email"]
    @owner.save
    erb :"edit_category_success"
  end
end
  #methods
  # save
  #success page or back to profile.

  