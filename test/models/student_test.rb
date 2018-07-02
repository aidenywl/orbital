require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @student = Student.new(name: "Jordan Liew", email:"yewwoei.low@u.nus.edu", phone_number: "91523852", education_level: "University", dob: "15/10/1996")
  end

  test "should be valid" do
    assert @student.valid?
  end

  test "name should be present" do 
    @student.name = "    "
    assert_not @student.valid?
  end

  test "email should be present" do
    @student.email = "    "
    assert_not @student.valid?
  end

  test "name should not be too long" do
    @student.name = "a" * 51
    assert_not @student.valid?
  end

  test "email should not be too long" do
    @student.email = "a" * 244 + "@example.com"
    assert_not @student.valid?
  end

end
