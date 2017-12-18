module ApplicationHelper
  def set_ranking_data
    @ids = REDIS.zrevrangebyscore "blogs/pv", "+inf", 0, limit: [0, 5], withscores: true
    # @ranking_blogs = ids.map{ |id, score| Blog.find(id) }
    # if @ranking_blogs.count < 5
    #   adding_blogs = Blog.order(published_at: :DESC, updated_at: :DESC).where.not(id: ids).limit(5 - @ranking_blogs.count)
    #   @ranking_blogs.concat(adding_blogs)
    # end
  end
end
