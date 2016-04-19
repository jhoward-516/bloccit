class FavoriteMailer < ApplicationMailer
    default from: "longhornjoho@gmail.com"
    
    def new_comment(user, post, comment)
        
        headers["Message-ID"] = "<comments/#{comment.id}@pacific-dusk-25249.herokuapp.com>"
        headers["In-Reply-To"] = "<post/#{post.id}@pacific-dusk-25249.herokuapp.com>"
        headers["References"] = "<post/#{post.id}@ypacific-dusk-25249.herokuapp.com>"
 
        @user = user
        @post = post
        @comment = comment
        
        mail(to: user.email, subject: "New comment on #{post.title}")
    end
end
