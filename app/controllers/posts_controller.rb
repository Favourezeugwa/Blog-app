class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    newpost = Post.new
    respond_to do |format|
      format.html { render :new, locals: { newpost: newpost } }
    end
  end

  def create
    # new object from params
    newpost = Post.new(params.require(:post).permit(:title, :text))
    # respond_to block
    respond_to do |format|
      format.html do
      # if question saves
        if newpost.save
          # success message
          flash[:success] = "Post saved successfully"
          # redirect to index
          redirect_to user_posts_url
        else
          # error message
          flash.now[:error] = "Error: Post could not be saved"
          # render new
          render :new, locals: { newpost: newpost }
        end
      end
    end
  end
end
