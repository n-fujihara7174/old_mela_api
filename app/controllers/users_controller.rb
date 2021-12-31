class UsersController < ApplicationController

    def index
        @users = User.join_post_all
        #logger.debug "user.all : #{@users.size}"
        @users = @users.search_user_id_or_email(params[:user_id_or_email]) if params[:user_id_or_email].present?
        render :json => @users
    end

    def show
        @user = User.join_post_find_id(params[:id])
        logger.debug("@userのクラス #{@user.class}")
        render :json => @user
    end
end
