class PostsController < ApplicationController
  

        def index
            @posts=Post.all
        end 
        
        def new
            @user_post = User.find(params[:user]) # desde el show del usuario se recibe la variable user enviada por la url
            @post = Post.new
        end  
        
        def create
            @user = User.find(params[:post][:user_id]) #se recibe del formulario el user_id y se busca al usuario
            @post = @user.posts.create(post_params)
            redirect_to user_path(@user)
        end
    
        def edit
            @user_post = User.find(params[:user]) # desde el show del usuario se recibe la variable user enviada por la url
            @post = Post.find(params[:id])
        end
    
        def update
            @user = User.find(params[:post][:user_id]) #se recibe del formulario el user_id y se busca al usuario
            @post = Post.find(params[:id])
            @post.update(post_params)
            redirect_to user_path(@user)
        end
    
        def destroy
            @post = Post.find(params[:id])
            @user = User.find(@post.user_id)
            @post.destroy
            redirect_to user_path(@user)
        end
      
        private
        def post_params
            params.require(:post).permit(:title,:description)   
        end  
    
end
