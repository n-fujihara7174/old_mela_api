class User < ApplicationRecord
    has_many :post
    has_many :like
    has_many :message

    #def get_login_user_profile
    #    return @user
    #end
end
