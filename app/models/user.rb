class User < ActiveRecord::Base
    validates :username,  presence: true,  length: { maximum: 49 }
    validates :email, presence: true, length: { maximum: 255 }
    validates :password, length: { minimum: 8 }
    has_secure_password
    has_attached_file :image, styles: { small: "80x80#", med: "100x100", large: "200x200" }
    validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
    has_many :recipes, dependent: :destroy
    has_many :relationships, :foreign_key => "souschef_id",
                             :dependent => :destroy
                       
    has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "souschef_id",
                                  dependent:   :destroy
    has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "connoisseur_id",
                                   dependent:   :destroy
    has_many :connoisseur, through: :active_relationships, source: :connoisseur
    has_many :souschef, through: :passive_relationships, source: :souschef
    def feed
        Recipe.where("user_id = ?", id)
    end

    def follow(other_user)
        connoisseur << other_user
    end

  # Unfollows a user.
    def unfollow(other_user)
        connoisseur.delete(other_user)
    end

  # Returns true if the current user is following the other user.
    def connoisseur?(other_user)
        connoisseur.include?(other_user)
    end
end
