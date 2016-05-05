module UsersHelper
    
        
    def has_posts_comments
        @user = User.find(params[:id])
        user_posts = @user.post.length
        user_comments = @user.post.comments.length
    end
        
end
