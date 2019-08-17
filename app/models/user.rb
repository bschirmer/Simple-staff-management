class User < ApplicationRecord
    has_one :organisation
    has_many :shifts
end
