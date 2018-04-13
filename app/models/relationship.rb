class Relationship < ActiveRecord::Base
    belongs_to :souschef, class_name: "User"
    belongs_to :connoisseur, class_name: "User"
    validates :souschef_id, presence: true
    validates :connoisseur_id, presence: true
end
