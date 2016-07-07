class Book < ApplicationRecord
  default_scope proc {
    if Thread.current[:test]
      puts 'no scoping'
      all
      # no scoping
    else
      where(deleted_at: nil)
    end
  }

  belongs_to :user, inverse_of: :books
end
