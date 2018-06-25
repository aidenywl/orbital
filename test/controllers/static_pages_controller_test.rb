require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @website_name = "OneSource"
  end

  test "should get root" do
    get root_path
    assert_template 'static_pages/home'
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@website_name} | Home"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "#{@website_name} | About"
  end

  test "should get competition_list" do
    get competitions_path
    assert_response :success
    assert_select "title", "#{@website_name} | Competitions"
  end

end
