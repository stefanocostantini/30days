# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def days
	
		days = ((Time.now-@item.created_at)/86400).to_int
		
	end
	
	def total_items
	
		total_items = @current_user.items.size 
		
	end
	
	def old_items
	
		old_items = @current_user.items.count(:all, :conditions => { :old => true })
		
	end
	
	
end
