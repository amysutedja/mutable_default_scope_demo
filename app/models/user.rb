class User < ApplicationRecord
  has_many :books, inverse_of: :user
end
