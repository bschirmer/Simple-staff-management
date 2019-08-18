class User < ApplicationRecord
    has_one :organisation
    has_secure_password
    validates :email, presence: true, uniqueness: true
end
