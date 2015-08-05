
class Contact
	attr_writer :first_name, :middle_name, :last_name

	def first_name
		@first_name
	end

	def middle_name
		@middle_name
	end

	def last_name
		@last_name
	end

	def last_first
		last_first = last_name
		last_first +=", "
		last_first += first_name
		if !@middle_name.nil?
			last_first += " ."
			last_first += middle_name.slice(0,1)
		end
		last_first
	end

	def full_name
		full_name = first_name
		if !@middle_name.nil?
			full_name += " "
			full_name += middle_name
		end
		full_name += " "
		full_name += last_name
		full_name
	end

	def first_last
		first_last += first_name
		first_last += " "
		first_last += last_name
		first_last
	end

	def to_s(format = 'full_name')
		case format
		when 'full_name'
			full_name
		when 'last_first'
			last_first
		when 'first'
			first_name
		when 'last'
			last_name
		
		end
	end
end

david = Contact.new
david.first_name = "David"
david.last_name = "Valles"
puts david.full_name
puts david.to_s('last')

juan = Contact.new
juan.first_name = "Juan"
juan.middle_name = "Carlos"
juan.last_name = "Vidal"
puts juan.last_first
puts juan.to_s('first')
