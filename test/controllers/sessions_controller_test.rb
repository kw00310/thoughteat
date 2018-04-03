require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "get new test" do
    get login_path
    assert_response :success
  end

end
