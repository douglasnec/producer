class Comment < ActiveRecord::Base
  belongs_to :post

	validates_presence_of :body, :post
	validates_associated :post
	attr_accessible :author, :email, :url, :body
	
	# atribuindo allow_blank para os dois campos abaixo
	with_options :allow_blank => true do |c|
		#validando com express�es regulares
	 c.validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	 c.validates_format_of :url,   :with => /^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$/ix
	end
end