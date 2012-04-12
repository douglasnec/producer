	class PostsController < ApplicationController
	respond_to :html, :xml, :json
	include ActiveModel::MassAssignmentSecurity
	attr_accessible :category

	
	before_filter :load_resources, :only => %w(edit new update create)
	
  def index
    @posts = Post.all
    respond_with @posts
  end

  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  def new
    @post = Post.new

	respond_with @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])

    if @post.save
		flash[:notice] = "Post was succefully created."		
	end
	respond_with @post
  end

  def update
    @post = Post.find(params[:id])

    
	  if @post.update_attributes(params[:post])
			flash[:notice] = "Post was successfully updated"
	  end
		
		respond_with @post    
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
	
	private 
	
	def load_resources
		@authors = User.all
		@categories = Category.all
	end
end
