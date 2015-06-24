get "/home" do
  erb :user_menu
end

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
#/edit profile --------------------------------------------------
get "/edit_profile/:x" do
  @owner = Owner.find(params["x"])
  erb :"edit_profile"
end
# edit form
# hidden field to pass id
  
get "/save_profile" do
  @owner = Owner.find(params["id"])
  # both name_valid and email_valid must return true before saving to object and database.
  if @owner.name_valid(params["name"]) && @owner.email_valid(params["email"])
    @owner.save
    erb :"edit_profile_success"
  else
    @error = true
    erb :"edit_profile"
  end
end

 

  