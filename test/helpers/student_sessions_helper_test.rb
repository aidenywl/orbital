require 'test_helper'

class StudentSessionsHelperTest < ActionView::TestCase

  def setup
    @student = students(:michael)
    remember(@student)
  end

  test "current_student returns right student when session is nil" do
    assert_equal @student, current_student
    assert is_logged_in?
  end

  test "current_student returns nil when remember digest is wrong" do
    @student.update_attribute(:remember_digest, Student.digest(Student.new_token))
    assert_nil current_student
  end
end