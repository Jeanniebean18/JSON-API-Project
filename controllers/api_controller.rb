# shows apis
get  "/api/assignments" do
  @hash = Assignment.hash_objects
  json @hash 
end

get "/api/show_assignments" do
  erb :"api/show_assignments"
end

get "/api/assignments/:id" do
  @assignment = Assignment.hash_object(params[:id])
  json @assignment
end
 

  