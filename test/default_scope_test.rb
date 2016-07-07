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

  test 'default_scope' do
    u = User.first

    puts Book.where(id: u.books).to_sql

    Thread.current[:test] = true

    puts Book.where(id: u.books).to_sql
  end
end
