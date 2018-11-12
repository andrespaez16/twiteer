class PostsController < ApplicationController
  

        def index
            @posts=Post.all
        end 
        
        def new
            @user = User.first
            @post = Post.new
        end  
        
        def create
            @user = User.first #pendiente saber como pasar esta variable trayendola del usuario del post
            @post = @user.posts.create(post_params)
            redirect_to posts_path
        end
    
        def edit
            @post = Post.find(params[:id])
        end
    
        def update
            @user = User.first #pendiente saber como pasar esta variable trayendola del usuario del post
            @post = Post.find(params[:id])
            @post.update(post_params)
            redirect_to posts_path
        end
    
        def destroy
            @post = Post.find(params[:id])
            @post.destroy
            redirect_to posts_path
        end
      
        private
        def post_params
            params.require(:post).permit(:title,:description)   
        end  
    
end
