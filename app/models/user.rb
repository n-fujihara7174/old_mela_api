class User < ApplicationRecord
    has_many :post
    has_many :like
    has_many :message
    has_many :message_user

    has_secure_password

    validates :user_name, :user_id, :password_digest, :email, :birthday, presence: {message: "必ず入力してください"} #必須チェック
    validates :user_id, :email, :phone_number, uniqueness: {message: "この%{attribute}はすでに使用済みです"}    #重複チェック
    validates :user_name, :user_id, :password_digest, length: {maximum: 45, message: "45文字以下で入力してください"}    #ユーザー名 : 長さチェック
    validates :self_introduction, length: {maximum: 120, message: "120文字以下で入力してください"}  #自己紹介 : 長さチェック
    validates :email, length: {maximum: 256, message: "256文字以下で入力してください"}  #メールアドレス : 長さチェック
    validates :phone_number, length: {maximum: 11, message: "11文字以下で入力してください"}, numericality: {message: "数値のみを入力してください"} #電話番号 : 長さチェック、数値チェック

    Post_count_query = "(SELECT COUNT(id) AS post_count FROM posts WHERE user_id = ?) AS post_count_query"
    Like_count_query = "(SELECT COUNT(likes.id) AS like_count FROM posts INNER JOIN likes ON posts.id = likes.post_id WHERE posts.user_id = ?) AS like_count_query"
    Follow_count_query = "(SELECT COUNT(follower_user_id) AS follow_count FROM follows WHERE follow_user_id = ? ) AS follow_count_query"
    Follower_count_query = "(SELECT COUNT(follow_user_id) AS follower_count FROM follows WHERE follower_user_id = ? ) AS follower_count_query"
    Message_user_count_query = "(SELECT COUNT(opposite_user_id) AS message_user_count FROM message_users WHERE user_id = ?) AS message_user_count_query"

    def self.join_post_all()
        User.order(user_id: :ASC)
    end

    def self.search_user_id_or_email(parameter)
        #Rails.logger.debug "book.delete_flg #{self.joins(:post).select('users.*,posts.*').where("user_name like ?", "%#{user_name}%").size}"
        users = self.where("users.user_id like ? or email like ?", "%#{parameter.to_s}%", "%#{parameter.to_s}%").order(user_id: :ASC)
    end

    def self.join_post_find_id(id)
        sanitize_post_count_query = User.sanitize_sql_array([Post_count_query, id])
        sanitize_like_count_query = User.sanitize_sql_array([Like_count_query, id])
        sanitize_follow_count_query = User.sanitize_sql_array([Follow_count_query, id])
        sanitize_follower_count_query = User.sanitize_sql_array([Follower_count_query, id])
        sanitize_message_user_count_query = User.sanitize_sql_array([Message_user_count_query, id])

        User.select('*').from("#{sanitize_post_count_query}, #{sanitize_like_count_query}, #{sanitize_follow_count_query}, #{sanitize_follower_count_query}, #{sanitize_message_user_count_query}, users")
                   .where('users.id = ?', id).order(user_id: :ASC)
    end
end