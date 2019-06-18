require 'test_helper'

class DefaultScopeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @user = User.new
    @user.save!

    @book1 = Book.new
    @book1.user = @user
    @book1.save!

    @book2 = Book.new
    @book2.user = @user
    @book2.save!
  end

  teardown do
    Thread.current[:test] = nil
  end

  test 'default_scope generates wrong sql when clause changes' do
    u = User.first

    books = Book.where(id: u.books)

    puts "Correct SQL: #{books.to_sql}"

    assert_equal(books.count, 2)

    Thread.current[:test] = true

    books = Book.where(id: u.books)

    puts "Potentially Invalid SQL: #{books.to_sql}"

    assert_equal(books.count, 2)
  end
end
