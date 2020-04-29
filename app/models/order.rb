class Order < ApplicationRecord

	def groceries
		Groceries.all
	end

end
