class User < ActiveRecord::Base
    validates :username,  presence: true,  length: { maximum: 49 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :password, length: { minimum: 8 }
    has_secure_password
    has_attached_file :image, styles: { small: "80x80#", med: "100x100", large: "200x200" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
