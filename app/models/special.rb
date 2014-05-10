class Special < ActiveRecord::Base
  
   def getStyle
     if self.color
       "style=background-color:#" + self.color + ";"
     else
       "style=background-color:#fff;"
     end
   end
  
  
end
