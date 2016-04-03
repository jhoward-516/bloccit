require "random_data"

50.times do
    Post.create!(
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
        )
    end

Post.find_or_create_by(title: "Unique Test Title", body: "Unique Test Body Example.")

posts = Post.all

100.times do
    Comment.create!(
        post: posts.sample,
        body: RandomData.random_paragraph
        )
    end

Comment.find_or_create_by(post: post_id(101), body: "First Unique Comment")   
    
puts "Seeds finished."
puts "#{Post.count} posts created."
puts "#{Comment.count} comments created."