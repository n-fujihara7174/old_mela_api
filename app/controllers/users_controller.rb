class UsersController < ApplicationController

    def index
        #logger.debug "パラメタ確認用 : #{params.require(:user_name)}"

        @users = User.join_post_all
        #logger.debug "user.all : #{@users.size}"
        @users = @users.search_user_id_or_email(params[:user_id_or_email]) if params[:user_id_or_email].present?
        render :json => @users
    end

    def show
        @user = User.joins(:post).select('users.*,posts.*').find(params[:id])
        render :json => @user
    end
end
