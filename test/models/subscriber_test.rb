require 'test_helper'

class SubscriberTest < ActiveSupport::TestCase
  test "should not save the subscriber without an email" do
    subscriber = Subscriber.create() 
    assert_not subscriber.save
    assert_includes subscriber.errors.messages[:email], "can't be blank"
    assert_equal 1, subscriber.errors.size
  end

  test "should save the subscriber with everything" do
    subscriber = Subscriber.create(email: "test@test.com") 
    assert subscriber.save
    assert_equal 0, subscriber.errors.size
  end
end
