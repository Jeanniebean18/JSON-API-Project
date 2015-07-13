get "/home" do
  erb :"assignments/user_menu"
end

# add owner------------------------------------------------------
get "/add_assignment" do
  erb :"assignments/add_assignment"
end

get "/save_assignment" do
  @assignment = Assignment.new({"name" => params["name"], "description" => params["description"], "github" => params["github"]})
  assignment_id = @assignment.add_to_database
 
  @article_links = (params["article_links"]).split(',') # array of strings
  
  @article_links.each do |link|
  @link = Link.new({"assignment_id" => assignment_id, "link" => link, "type" =>"article"})
  @link.add_to_database
  end
  
  @video_links = (params["video_links"]).split(',') # array of strings
  
  @video_links.each do |link|
  @link = Link.new({"assignment_id" => assignment_id, "link" => link, "type" =>"video"})
  @link.add_to_database
  end
  
  @partner_names = (params["partners"]).split(',') # array of strings
  
  @partner_names.each do |name|
  @partner = Partner.new({"assignment_id" => assignment_id, "name_worked" => name})
  @partner.add_to_database
  end
  
  erb :"assignments/save_assignment_success"
  
  
end

get "/api_assignment" do
  @hash = Assignment.hash_objects

  json @hash 
end

# delete assignment -------------------------------------------------
get "/delete_assignment_form" do
  erb :"assignments/delete_assignment"
end

get "/delete_assignment" do
  @assignment = Assignment.find(params["id"])
  if params["decision"] == "yes"
    @assignment.delete
    "deleted."
    '<a href = "/home">return home</a>' # make erb for this.
  else
    "not deleted."
  end
end
# # select existing owner------------------------------------------
get "/show_assignments" do
  erb :"assignments/show_assignments"
end
# #/edit profile --------------------------------------------------
# get "/edit_profile/:x" do
#   @owner = Owner.find(params["x"])
#   erb :"edit_profile"
# end
# # edit form
# # hidden field to pass id
#
# get "/save_profile" do
#   @owner = Owner.find(params["id"])
#   # both name_valid and email_valid must return true before saving to object and database.
#   if @owner.name_valid(params["name"]) && @owner.email_valid(params["email"])
#     @owner.save
#     erb :"edit_profile_success"
#   else
#     @error = true
#     erb :"edit_profile"
#   end
# end

 

  