class User < ApplicationRecord
	validates :firstname, presence: true,
              		length: { minimum: 4 }
    validates :surname, presence: true,
              		length: { minimum: 4 }
    validates :email, presence: true, uniqueness: true,
    			format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]+\z/,	message: "Invalid" }
    validates :password, presence: true, length: { minimum: 5 },
    			format: { with: /\A^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])\z/,	message: "too weak" }         		
end
