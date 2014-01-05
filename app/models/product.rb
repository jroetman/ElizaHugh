class Product < ActiveRecord::Base
#  attr_accessible :title, :description, :paragraph
   #attr_accessible :avatar
  belongs_to :category
  
  has_attached_file :image, 
                    :styles => {
                      :small => "150x150>",
                      :medium => "350x250>",
                      :large => "750x500>"
                      
                    }
                    
   validates_presence_of :title, :description, :price, :image
                   

end
