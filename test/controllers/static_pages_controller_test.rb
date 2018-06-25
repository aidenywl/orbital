require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @website_name = "OneSource"
  end

  test "should get root" do
    get root_url
    assert_template 'static_pages/home'
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "#{@website_name} | Home"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "#{@website_name} | About"
  end

  test "should get competition_list" do
    get static_pages_competition_list_url
    assert_response :success
    assert_select "title", "#{@website_name} | Competitions"
  end

end
