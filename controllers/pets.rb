# add pet------------------------------------------------------


  get "/add_pet/:x" do
    @owner = Owner.find(params["x"])
    # @owner = Owner.find(params["x"])
    # find pets where owner id = x
    erb :"add_pet"
  end





get "/save_pet" do
  @pet = Pet.new({"name" => params["name"], "owner_id" => params["owner_id"]})
  if @pet.name_valid(params["name"]) 
    @pet.add_to_database
    erb :"add_pet_success"
  else
    @error = true
    erb :"add_pet"
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