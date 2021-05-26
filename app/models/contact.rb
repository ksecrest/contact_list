class Contact < ApplicationRecord
    #associations
    #belongs to - tells who the parent is, only in child
    # has_many - only in parent, one to many relationship, multiple of the object
    # has_one - one to one relation, one parent/one child
    # has_many :through - many to many relationship
    # has_one :through - 
    #     dependent, has many and has one, delete all of child elements too

    has_many :notes, dependent: :destroy
    # has_one : note
    has_one :address, dependent: :destroy
     # Validations 
  # - make sure it meets some rules before going in the db
  # confirmation
  #   - if you have two fields make sure that they match 
  # inclusion
  #   - makes sure that it is in this given set 
  #   class Coffee < ActiveRecord::Base
  #     validates :size, inclusion: { 
  #       in: %w(small medium large),
  #         message: "%{value} is not a valid size" 
  #     }
  #   end
  # length
  #   - length in size, how many char 
  #   class Person < ActiveRecord::Base
  #     validates :name, length: { minimum: 2 }
  #     validates :bio, length: { maximum: 500 }
  #     validates :password, length: { in: 6..20 }
  #     validates :registration_number, length: { is: 6 }
  #   end
  # numericality
  #   - is a type of number 
  #   class Player < ActiveRecord::Base
  #     validates :points, numericality: true
  #     validates :games_played, numericality: { only_integer: true }
  #     validates :golf_handicap, numericality: { less_than_or_equal_to: 40.4, greater_than_or_equal_to: 2 }
  #   end
  # presence
  #   - makes sure the value is not empty 
  #   class Person < ActiveRecord::Base
  #     validates :name, :login, :email, presence: true
  #   end
  # uniqueness 
  # class Account < ActiveRecord::Base
  #   validates :email, uniqueness: true
#   allow_nil
#   allow_blank
#   message
  # end
  validates :first_name, :last_name, :age, :phone, :email, presence: true 
  validates :email, uniqueness: true 
  validates :age, numericality: { only_integer: true }

  # Callback - trigger some logic or code base on action 
  # before_validation
  # after_validation
  # around_validation
  # before_save
  # after_save
  # around_save
  # before_create
  # after_create
  # around_create 
  # class CreditCard < ActiveRecord::Base
  #   before_save :encrypt_card_number
  #   private
  #     def encrypt_card_number
  #       self.card_number = bcrypt(self.card_number)
  #     end
  # end
  # Model methods 
  # Fat models skinny controllers- any logic wise would be in the model , 
  # class methods 
  # class Person < ActiveRecord::Base
  #   # called on a class Person.by_first_name
  #   def self.by_first_name
  #     order(:first_name)
  #   end
  # end
  # instance methods
  # class Person < ActiveRecord::Base
  #   # called on an instance @person.full_name
  #   def full_name
  #    "#{self.first_name} {self.last_name}"
  #   end
  # end

end
