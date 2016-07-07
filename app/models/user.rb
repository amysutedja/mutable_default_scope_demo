class User < ApplicationRecord
  default_scope proc {
    if Thread.current[:test]
      puts 'no scoping'
      all
      # no scoping
    else
      where(deleted_at: nil)
    end
  }

  has_many :books, inverse_of: :user
end
