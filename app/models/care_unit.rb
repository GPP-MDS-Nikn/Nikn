class CareUnit < ActiveRecord::Base
  # Impossible to create a care unit without a district
  validates(:district, presence: true)
  # The district field should have only 2 upercase characters
  district_regex = /\A[A-Z]{2}\z/
  wrong_format_message = "Only allow 2 upercase characters."
  validates(:district, format: { with: district_regex, message: wrong_format_message })
  # The size of the string must be 2 (DF, MG, BA)
  VALID_DISTRICT_STRING_SIZE = 2
  validates(:district, length: { is: VALID_DISTRICT_STRING_SIZE })

  # Impossible to create a care unit without a category
  validates(:category, presence: true)
  CATEGORY_MAX_LENGTH = 150
  CATEGORY_MIN_LENGTH = 10
  validates(:category, length: { in: CATEGORY_MIN_LENGTH...CATEGORY_MAX_LENGTH })

  # Impossible to create a care unit without an institution
  validates(:institution, presence: true)
  INSTITUTION_MAX_LENGTH = 150
  INSTITUTION_MIN_LENGTH = 10
  validates(:institution, length: { in: INSTITUTION_MIN_LENGTH...INSTITUTION_MAX_LENGTH })

  # Impossible to create a care unit without a description of its services
  validates(:description, presence: true)
  DESCRIPTION_MAX_LENGTH = 2000
  DESCRIPTION_MIN_LENGTH = 100
  validates(:description, length: { in: DESCRIPTION_MIN_LENGTH...DESCRIPTION_MAX_LENGTH })

  # Impossible to create a care unit without a name
  validates(:name, presence: true)
  NAME_MAX_LENGTH = 100
  NAME_MIN_LENGTH = 10
  validates(:name, length: { in: NAME_MIN_LENGTH...NAME_MAX_LENGTH })

  # Impossible to create a care unit without an physic address
  validates(:address, presence: true)
  ADDRESS_MAX_LENGTH = 150
  ADDRESS_MIN_LENGTH = 30
  validates(:address, length: { in: ADDRESS_MIN_LENGTH...ADDRESS_MAX_LENGTH })

  # Impossible to create a care unit without a valid zipcode
  validates(:zip_code, presence:true)
  # The zipcode should be like xxxxx-xxx
  zip_code_regex = /\A[0-9]{5}-[0-9]{3}\z/
  wrong_zip_code_format_message = "The zip code should be in the 55555-333 format."
  validates(:zip_code, format: { with: zip_code_regex, message: wrong_zip_code_format_message })

  # There is possible to create care unit without a email, but
  # if the email is present, it should be in the following format
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, format: { with: email_regex }, unless: :blank_email?)

  # Impossible to create a care unit without a city
  validates(:city, presence: true)
  CITY_MAX_LENGTH = 50
  CITY_MIN_LENGTH = 2
  validates(:city, length: { in: CITY_MIN_LENGTH...CITY_MAX_LENGTH })

  # Impossible to create a care unit without a phone number
  validates(:phone, presence: true)
  # The format of the number should be (22)4444-4444 or (22) 55555-4444
  phone_number_regex = /\A\([0-9]{2}\)\s*[0-9]{4,6}-[0-9]{4,6}\z/
  wrong_phone_number_format_message = "The phone number format should be (22)4444-4444 or (22) 55555-4444."
  validates(:phone, format: { with: phone_number_regex, message: wrong_phone_number_format_message })

  # There is possible to create a care unit without a site.
  # Some institutions don't have a web page.

  # Impossible to create a care unit without a latitude and longitude coordinates
  validates(:latitude, :longitude, presence: true)

  # This is necessary to the Google Map plugin works.
  geocoded_by :address
  geocoded_by :district
  geocoded_by :city
  after_validation :geocode
  
  private
    # Method to verify if the email field wasn't filled
    def blank_email?
      return email == ""
    end

    # Method to turn the model searchable
    # This will work in development with SQLite. If you switch to
    # PostgreSQL in productionm you may need to change
    def self.search(search)
      where("name LIKE ?", "%#{search}%")
      where("city LIKE ?", "%#{search}%")
      where("institution LIKE ?", "%#{search}%")
      where("site LIKE ?", "%#{search}%")
      where("address LIKE ?", "%#{search}")
    end
end
