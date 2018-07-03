require 'test_helper'

class StudentLoginTest < ActionDispatch::IntegrationTest
  
  test "login with invalid information" do
    get login_path
    assert_template 'student_sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'student_sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

end
