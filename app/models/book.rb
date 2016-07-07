class Book < ApplicationRecord
  default_scope proc {
    if Thread.current[:test]
      all
    else
      where(deleted: false)
    end
  }

  belongs_to :user, inverse_of: :books
end
