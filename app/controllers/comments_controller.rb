class CommentsController < ApplicationController
  
	def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])

    unless @comment.save
      flash[:alert] = "Fail to receive your comment."
    end
    redirect_to @post
  end
end
