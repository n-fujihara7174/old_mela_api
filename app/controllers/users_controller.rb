class UsersController < ApplicationController

    def index
        if params[:searchParam].present? then
            logger.debug "パラメタ確認用 : #{params[:searchParam]}"
            @users = User.joins(:post).select('users.*,posts.*')\
            .where("user_name = ? and display_user_name = ? ", search_param.user_name, search_param.display_user_name)
        else
            @users = User.joins(:post).select('users.*,posts.*')
        end
        render :json => @users
    end

    def show
        @user = User.joins(:post).select('users.*,posts.*').find(params[:id])
        render :json => @user
    end

    private

    def search_param
        params.require(:searchParam).permit(:userName,:userId)
    end

end
