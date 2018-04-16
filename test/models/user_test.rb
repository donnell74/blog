require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save the user without an email" do
    user = User.create(password: "test", password_confirmation: "test") 
    assert_not user.save
    assert_includes user.errors.messages[:email], "can't be blank"
    assert_equal 1, user.errors.size
  end

  test "should not save when password and confirmation are different" do
    user = User.create(email: "test@test.com", password: "test", password_confirmation: "nomatch") 
    assert_not user.save
    assert_includes user.errors.messages[:password_confirmation], "doesn't match Password"
    assert_equal 1, user.errors.size
  end

  test "should save the user with everything" do
    user = User.create(email: "test@test.com", password: "test", password_confirmation: "test") 
    assert user.save
    assert_equal 0, user.errors.size
  end
end
