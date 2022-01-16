class PostsController < ApplicationController

  def index
    @posts = Post.user_join_all
    logger.debug "@postsクラス : #{@posts.class}"
    @posts = @posts.search_user_name(params[:user_name]) if params[:user_name].present?
    @posts = @posts.search_post_contents(params[:post_contents]) if params[:post_contents].present?
    render :json => @posts
  end

end