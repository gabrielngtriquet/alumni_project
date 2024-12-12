class PostsController < ApplicationController
    def index
      matching_posts = Post.all
  
      @list_of_posts = matching_posts.order({ :created_at => :desc })
  
      render({ :template => "posts/index" })
    end
  
def show
  the_id = params.fetch("path_id")
  @the_post = Post.find_by(id: the_id)

  if @the_post.nil?
    redirect_to(posts_path, alert: "Post not found.") and return
  end

  @list_of_comments = @the_post.comments.order(created_at: :desc)
end

  
    def create
      the_post = Post.new
      the_post.user_id = params.fetch("query_user_id")
      the_post.content = params.fetch("query_content")
      the_post.comments_count = params.fetch("query_comments_count")
  
      if the_post.valid?
        the_post.save
        redirect_to("/posts", { :notice => "Post created successfully." })
      else
        redirect_to("/posts", { :alert => the_post.errors.full_messages.to_sentence })
      end
    end
  
    def update
      the_id = params.fetch("path_id")
      the_post = Post.where({ :id => the_id }).at(0)
  
      the_post.user_id = params.fetch("query_user_id")
      the_post.content = params.fetch("query_content")
      the_post.comments_count = params.fetch("query_comments_count")
  
      if the_post.valid?
        the_post.save
        redirect_to("/posts/#{the_post.id}", { :notice => "Post updated successfully."} )
      else
        redirect_to("/posts/#{the_post.id}", { :alert => the_post.errors.full_messages.to_sentence })
      end
    end
  
    def destroy
      the_id = params.fetch("path_id")
      the_post = Post.where({ :id => the_id }).at(0)
  
      the_post.destroy
  
      redirect_to("/posts", { :notice => "Post deleted successfully."} )
    end
  end
  