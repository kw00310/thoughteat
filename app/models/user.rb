class User < ActiveRecord::Base
    validates :username,  presence: true,  length: { maximum: 49 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :password, length: { minimum: 8 }
    has_secure_password
end
