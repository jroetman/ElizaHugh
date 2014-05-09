module CategoriesHelper

	def cache_key_for_categories
	    count = Category.count
	    "categories/all-#{count}"
	end
   
end