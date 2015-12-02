class Ong < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

   # Give it roles
  rolify
	# Include default role to an user after its creation
 	after_create :default_role
	# Attach images to ongs
	# Paperclip gem sintax for upload image files.
	has_attached_file :image_file, :styles => {}, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :image_file, :content_type => /\Aimage\/.*\Z/

	# Validations
	# Code below is used to validate ong's attributes. First of all, validation constants are defined, then attributes are validated in three sections: 'basic information', 'contact details', and 'localization details'.

	# Constants (in characters)
	NAME_MIN_LENGTH 				= 2
	DESCRIPTION_MIN_LENGTH 			= 100
	SITE_MIN_LENGTH 				= 5
	PHONES_MIN_LENGTH	 			= 10
	PHONES_MAX_LENGTH 				= 11
	CEP_LENGTH 						= 8
	ADDRESS_MIN_LENGTH 				= 10
	UF_LENGTH 						= 2
	CITY_MIN_LENGTH 				= 3

	# Basic information
	validates(:name, presence: true)
	validates(:name, uniqueness: true)
	validates(:name, length: {:minimum => NAME_MIN_LENGTH})
	validates(:description, presence: true)
	validates(:description, length: {:minimum => DESCRIPTION_MIN_LENGTH})

	# Contact details
	validates(:site, uniqueness: true, unless: "site.blank?" )
	validates(:site, length: {:minimum => SITE_MIN_LENGTH}, allow_blank: true)
	validates(:phone, presence: true)
	validates(:phone, uniqueness: true)
	validates(:phone, numericality: { only_integer: true })
	validates(:phone, length: {in: PHONES_MIN_LENGTH..PHONES_MAX_LENGTH})
	validates(:auxiliary_phone, uniqueness: true, unless: "auxiliary_phone.blank?" )
	validates(:auxiliary_phone, numericality: { only_integer: true }, allow_blank: true)
	validates(:auxiliary_phone, length: {in: PHONES_MIN_LENGTH..PHONES_MAX_LENGTH}, allow_blank: true)

	# Localization details
	validates(:cep, presence: true)
	validates(:cep, uniqueness: true)
	validates(:cep, length: {is: CEP_LENGTH})
	validates(:cep, numericality: { only_integer: true })
	validates(:address, presence: true)
	validates(:address, length: {:minimum => ADDRESS_MIN_LENGTH})
	validates(:uf, presence: true)
	validates(:uf, length: {is: UF_LENGTH})
	validates(:uf, inclusion: { in: %w(AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO), message: "%{value} is not a valid UF" })
	validates(:city, presence: true)
	validates(:city, length: {:minimum => CITY_MIN_LENGTH})

	private
		# Add a default role to an user at its creation
		def default_role
			self.roles << Role.find_by_name("ong")
			self.save
		end

end
