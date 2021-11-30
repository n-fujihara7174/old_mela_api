class UsersController < ApplicationController

    def index

    end

    def show
        @user = User.joins(:post).select('users.*,posts.*').find(params[:id])
        render :json => @user
    end


end
