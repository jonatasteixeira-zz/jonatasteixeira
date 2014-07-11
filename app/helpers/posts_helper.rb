module PostsHelper

  def latest_posts
    Post.order('created_at DESC').limit(6)
  end

  def short_body(post)
    if post.body.length > 200
      return post.body.first(197) + "..."
    else
      return post.body
    end
  end


end
