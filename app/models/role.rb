class Role < ApplicationRecord
has_many :users, through: :user_role_grants

UniquenessErrorMessage = "この%{attribute}はすでに使用済みです"
validates :name, presence: true, uniqueness: {message: UniquenessErrorMessage}

end