class Special < ActiveRecord::Base
  
   def getStyle
     if self.color
       "style='background-color:#" + self.color + ";'"
     else
       "style='background-color:#eee;'"
     end
   end
  
  
end
