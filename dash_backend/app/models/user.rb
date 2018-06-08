# class User < ApplicationRecord
#   has_secure_password
#   validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }
#   # validates :password, confirmation: true
#   # validates :password_confirmation, presence: true
#
#   has_many :trips
#
# end


class User < ApplicationRecord

  has_many :trips

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

end
