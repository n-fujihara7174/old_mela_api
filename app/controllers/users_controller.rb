class UsersController < ApplicationController

    def index
        #logger.debug "パラメタ確認用 : #{params.require(:user_name)}"

        @users = User.join_post_all
        @users.search_user_name(params[:user_name]) if params[:user_name].present?
        @users.search_user_id(params[:user_id]) if params[:user_id].present?
        @users.search_is_delete(params[:is_delete]) if params[:is_delete].present?

        render :json => @users
    end

    def show
        @user = User.joins(:post).select('users.*,posts.*').find(params[:id])
        render :json => @user
    end
end
