module ApplicationHelper

	def error_messages_for(resource)
	 render partial: "error_messages_for",
			locals: {resource: resource}
	end
	
	def flash_messages
		flash.collect do |key, msg|
			content_tag(:p, msg, :id => key, :class => "flash_message")
		end
	end
end
