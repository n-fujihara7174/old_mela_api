class PostsController < ApplicationController

  def index
    @posts = Post.user_join_all
    @posts = @posts.search_user_name(params[:user_name]) if params[:user_name].present?
    @posts = @posts.search_post_contents(params[:post_contents]) if params[:post_contents].present?
    render :json => @posts
  end

  def show
    @post = Post.get_post(params[:id])
    render :json => @post
  end

  def create
    @post = Post.new(get_post_param)
    @post.id = nil
    @user = User.get_user_by_user_id(get_unique_user_id.fetch(:unique_user_id))

    #入力されたユーザーIDのユーザーが見つかったか？
    if(@user)
      @post.user_id = @user.id
    else
      #見つからなかった場合、バリデーションに引っかかる値を代入
      @post.user_id = 0
    end

    if @post.save
        render :json => @post
    else
        render :json => @post.errors, status: :unprocessable_entity
    end
  end



  def update
    @post = Post.find(get_id.fetch(:id))
    @post.assign_attributes(get_post_param)
    @user = User.get_user_by_user_id(get_unique_user_id.fetch(:unique_user_id))

    #入力されたユーザーIDのユーザーが見つかったか？
    if(@user)
      @post.user_id = @user.id
    else
      #見つからなかった場合、バリデーションに引っかかる値を代入
      @post.user_id = 0
    end

    if @post.update(user_id: @post.user_id,
                    post_contents: @post.post_contents,
                    post_image: @post.post_image,
                    is_delete: @post.is_delete)
      render :json => @post
    else
        render :json => @post.errors, status: :unprocessable_entity
    end
  end

  private

  def get_id
    params.require(:post).permit(:id)
  end

  def get_unique_user_id
    params.require(:post).permit(:unique_user_id)
  end

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