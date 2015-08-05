require "./contact.rb"

class AddressBook

	attr_reader :contacts

	def initialize
		@contacts = []
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
address_book.print_contacts_list