module UsersHelper
    
    def has_comments(post)
        post.comments.length > 0
    end
end
