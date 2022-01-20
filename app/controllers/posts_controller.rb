class PostsController < ApplicationController

  def index
    @posts = Post.user_join_all
    @posts = @posts.search_user_name(params[:user_name]) if params[:user_name].present?
    @posts = @posts.search_post_contents(params[:post_contents]) if params[:post_contents].present?
    render :json => @posts
  end

  def show
    @user = User.join_post_find_id(params[:id])
    render :json => @user
  end

  def create
    @post = Post.new(get_post_param)
    @post.id = nil
    @post.user_id = User.find_by_user_name
    if @post.save
        render :json => @post
    else
        render :json => @post.errors, status: :unprocessable_entity
    end
  end

  private

  def get_post_param
    params
    .require(:post)
    .permit(
        :id,
        :user_id,
        :post_contents,
        :post_image,
        :is_delete,
        :created_at,
    )
end

end