class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end
