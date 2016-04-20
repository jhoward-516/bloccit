class CommentsController < ApplicationController
    
    before_action :require_sign_in
    before_action :authorize_user, only: [:destroy]
    
    def create
        @resource = params[:topic_id] ? Topic.find(params[:topic_id]) : Post.find(params[:post_id])
        # @topic = Topic.find(params[:topic_id])
        # @post = Post.find(params[:post_id])
        comment = @resource.comments.new(comment_params)
        comment.user = current_user
 
        if comment.save
            flash[:notice] = "Comment saved successfully."
        else
            flash[:alert] = "Comment failed to save."
        end
        
        if @resource.is_a?(Post)
            redirect_to [@resource.topic, @resource]
        else
            redirect_to [@resource]
        end
    end
    
    def destroy
        
        comment = Comment.find(params[:id])
        @resource = comment.post || comment.topic
        
 
        if comment.destroy
            flash[:notice] = "Comment was deleted."
        else
            flash[:alert] = "Comment couldn't be deleted. Try again."
        end
        
        if @resource.is_a?(Post)
            redirect_to [@resource.topic, @resource]
        else
            redirect_to [@resource]
        end
        
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:body)
    end
    
    def authorize_user
        comment = Comment.find(params[:id])
        unless current_user == comment.user || current_user.admin?
            flash[:alert] = "You do not have permission to delete a comment."
            redirect_to [comment.post.topic, comment.post]
        end
    end
    
end
