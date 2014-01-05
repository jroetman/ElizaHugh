class Special < ActiveRecord::Base
  

   def getStyle
     "style=background-color:#" + self.color + ";"
   end
  
  
end
