class Cartitem < ActiveRecord::Base
    belongs_to :user, foreign_key: "id"
    belongs_to :product, foreign_key: "productid"
    validates_uniqueness_of :user_id, scope: [:productid]
 
    
end
