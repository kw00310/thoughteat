require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(username: "ExampleUser", email: "user@example.com", password: "password", password_confirmation: "password")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "username needs to be present" do
    @user.username = "     "
    assert_not @user.valid?
  end
  
   test "email needs to be present" do
    @user.email = "     "
    assert_not @user.valid?
  end
  
  test "username should not be too long" do
    @user.username = "a" * 50
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a" * 250 + "@example.com"
    assert_not @user.valid?
  end
  test "password should not be blank" do
    @user.password = @user.password_confirmation = " "
    assert_not @user.valid?
  end
  test "password should be 8 characters or more" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end
end