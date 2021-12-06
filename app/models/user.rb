class User < ApplicationRecord
    has_many :post
    has_many :like
    has_many :message

    #def get_login_user_profile
    #    return @user
    #end

    def self.join_post_all()
        return User.joins(:post).select('users.*,posts.*')
    end

    def self.search_user_name(user_name)
        self.where("user_name like ?", "%#{user_name}%")
    end

    def self.search_user_id(user_id)
        self.where("display_user_id like ?", "%#{user_id}%")
    end

    def self.search_is_delete(is_delete)
        self.where("is_delete = ?", "%#{is_delete}%")
    end

end
