class Product < ActiveRecord::Base
    has_attached_file :avatar, :style=> {:medium => "300x300>", :thumb =>"100x100"}, :default_url => "/images/:style/missing.png"

end
