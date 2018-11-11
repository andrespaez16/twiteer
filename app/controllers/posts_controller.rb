class PostsController < ApplicationController

    def index
        @post=Post.all
    end 
    
    def new
        @post=User.new
    end  
    
    def create
        @post=Post.create(post_params)
    end   
    private
    def posts_params
        params.require(:post).permit(:title,:description,)   
    end  
end
