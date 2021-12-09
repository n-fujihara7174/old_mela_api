class User < ApplicationRecord
    has_many :post
    has_many :like
    has_many :message

    #def get_login_user_profile
    #    return @user
    #end

    def self.join_post_all()
        User.joins(:post).select('users.*, count(posts.id) as post_count').group('users.id').order(user_id: :ASC)
    end

    def self.search_user_id_or_email(parameter)
        #Rails.logger.debug "book.delete_flg #{self.joins(:post).select('users.*,posts.*').where("user_name like ?", "%#{user_name}%").size}"
        users = self.joins(:post).select('users.*,posts.*').where("user_id like ? or email like ?", "%#{parameter.to_s}%", "%#{parameter.to_s}%")
    end
end