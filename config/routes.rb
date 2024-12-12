Rails.application.routes.draw do
  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Post resource:

  # CREATE
  post("/insert_post", { :controller => "posts", :action => "create" })
          
  # READ
  get("/posts", { :controller => "posts", :action => "index" })
  
  get("/posts/:path_id", { :controller => "posts", :action => "show" })

  # Routes for Comments
post "/insert_comment", { controller: "comments", action: "create" }

# Routes for Likes
post "/insert_like", { controller: "likes", action: "create" }



  resources :posts do
    resources :comments, only: [:index, :create]
  end
  
  
  # UPDATE
  
  post("/modify_post/:path_id", { :controller => "posts", :action => "update" })
  
  # DELETE
  get("/delete_post/:path_id", { :controller => "posts", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Comment resource:


  # CREATE
  post("/insert_comment", { :controller => "comments", :action => "create" })
          
  # READ
  get("/comments", { :controller => "comments", :action => "index" })
  
  get("/comments/:path_id", { :controller => "comments", :action => "show" })
  
  # UPDATE
  
  post("/modify_comment/:path_id", { :controller => "comments", :action => "update" })
  
  # DELETE
  get("/delete_comment/:path_id", { :controller => "comments", :action => "destroy" })

  #------------------------------

  # Routes for the Job application resource:

  # CREATE
  post("/insert_job_application", { :controller => "job_applications", :action => "create" })
          
  # READ
  get("/job_applications", { :controller => "job_applications", :action => "index" })
  
  get("/job_applications/:path_id", { :controller => "job_applications", :action => "show" })
  
  # UPDATE
  
  post("/modify_job_application/:path_id", { :controller => "job_applications", :action => "update" })
  
  # DELETE
  get("/delete_job_application/:path_id", { :controller => "job_applications", :action => "destroy" })

  #------------------------------

  # Routes for the Job posting resource:

  # CREATE
  post("/insert_job_posting", { :controller => "job_postings", :action => "create" })
          
  # READ
  get("/job_postings", { :controller => "job_postings", :action => "index" })
  
  resources :job_postings, only: [:index, :show]

  get("/job_postings/:path_id", { :controller => "job_postings", :action => "show" })
  

  # UPDATE
  
  post("/modify_job_posting/:path_id", { :controller => "job_postings", :action => "update" })
  
  # DELETE
  get("/delete_job_posting/:path_id", { :controller => "job_postings", :action => "destroy" })

  resources :job_postings do
    resources :job_applications, only: [:new, :create, :index]

  end
  

  #------------------------------

  devise_for :users

  get "/alumni_directory", { :controller => "users", :action => "directory" }
  get "/users/:user_id/posts", { :controller => "posts", :action => "user_posts" }
  root to: "pages#home"

  get "/profile/edit", to: "users#edit", as: "edit_profile"
  patch "/profile", to: "users#update", as: "update_profile"



  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"

  
end
