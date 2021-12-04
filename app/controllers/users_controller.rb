class UsersController < ApplicationController

    def index
        @users = User.joins(:post).select('users.*,posts.*')
        render :json => @users
    end

    def show
        @user = User.joins(:post).select('users.*,posts.*').find(params[:id])
        render :json => @user
    end


end
