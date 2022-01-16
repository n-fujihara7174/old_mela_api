class Post < ApplicationRecord
    belongs_to :user
    has_many :like

    #全件検索
    def self.user_join_all()
        Post.select('posts.*, users.user_name') \
        .joins(:user) \
        .order(user_id: :ASC) \
        .order(created_at: :DESC)
    end

    #ユーザー名検索
    def self.search_user_name(parameter)
        Post.select('posts.*, users.user_name') \
        .joins(:user) \
        .where("users.user_name like ?", "%#{parameter.to_s}%") \
        .order(user_id: :ASC) \
        .order(created_at: :DESC)
    end

    #投稿内容検索
    def self.search_post_contents(parameter)
        Post.select('posts.*, users.user_name') \
        .joins(:user) \
        .where("post_contents like ?", "%#{parameter.to_s}%") \
        .order(user_id: :ASC) \
        .order(created_at: :DESC)
    end

end
