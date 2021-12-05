class UsersController < ApplicationController

    def index
        if params[:is_search].present? then
            logger.debug "パラメタ確認用 : #{params.require(:user_name)}"
            if (params.require(:user_name).present?) then
                query_text = "(user_name like ?)"
            else
                query_text = "(user_name like ? or True)"
            end
            @users = User.joins(:post).select('users.*,posts.*')\
            .where("user_name like ? and display_user_name like ? ", "%" + search_param.user_name + "%", "%" + search_param.display_user_name + "%")
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

end
