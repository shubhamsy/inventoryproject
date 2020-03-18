class Product < ApplicationRecord
	has_and_belongs_to_many :warehouses

	after_save :chkcount

	def self.chkcount
	  self.warehouses.each do |wh|	
	  	pcnt = Product.where("threshold >= ?", 10).count
	  	if(wh.try(:name) == "Mumbai")
	  	  if (self.threshold < 10)
			self.errors.messages	
		  end
	  	elsif(wh.try(:name) == "New Delhi")
	  	  tcnt = Product.where(warehouse_ids: wh.id).count / 2
	  	  if (pcnt >= tcnt)
			self.errors.messages	
		  end
		elsif (wh.try(:name) == "Bangalore")
	  	  tcnt = Product.where(warehouse_ids: wh.id).count / 3
	  	  if (pcnt >= tcnt)
			self.errors.messages	
		  end
		end
	  end
	end

end
