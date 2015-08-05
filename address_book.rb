require "./contact.rb"

class AddressBook

	attr_reader :contacts

	def initialize
		@contacts = []
	end

	def print_results(search, results)
	  puts search
	  results.each do |contact|
	    puts contact.to_s('full_name')
	    contact.print_phone_numbers
	    contact.print_addresses
	    puts "\n"
	  end
	end

	def find_by_name(name)
	  results = []
	  search = name.downcase
	  contacts.each do |contact|
	    if contact.full_name.downcase.include?(search)
	      results.push(contact)
	    end
	  end
	 print_results("Name search results (#{search})", results)
	end 

	def find_by_phone_number(number)
	  results = []
	  search = number.gsub("-", "")
	  contacts.each do |contact|
	    contact.phone_numbers.each do |phone_number|
	      if phone_number.number.gsub("-", "").include?(search)
	        results.push(contact) unless results.include?(contact)
	      end
	    end
	  end
	  print_results("Phone search results (#{search})", results)
	end


	def find_by_address(query)
	  results = []
	  search = query.downcase
	  contacts.each do |contact|
	    contact.addresses.each do |address|
	      if address.to_s('long').downcase.include?(search)
	        results.push(contact) unless results.include?(contact)
	      end
	    end
	  end
	  print_results("Address search results (#{search})", results)
	end


	def print_contacts_list
		contacts.each do |contact|
			puts contact.to_s('last_first')
		end
	end
end

address_book = AddressBook.new

david = Contact.new
david.first_name = "David"
david.last_name = "Valles"
david.add_phone_number("Home", "123-456-789")
david.add_address("Home", "123 Main St.", "", "Portland", "OR", "12345")

daniel = Contact.new
daniel.first_name = "Daniel"
daniel.last_name = "Valles"
daniel.add_phone_number("Home", "125-349-329")
daniel.add_address("Home", "123 Monte Palatino", "", "Monterrey", "NL", "66223")

address_book.contacts.push(david)
address_book.contacts.push(daniel)
#address_book.print_contacts_list

#address_book.find_by_name("D")

address_book.find_by_phone_number("123")