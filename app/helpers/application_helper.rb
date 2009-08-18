# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def days
	
		days = ((Time.now-@item.created_at)/86400).to_int
		
	end

end
