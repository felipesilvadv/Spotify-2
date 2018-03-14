require 'test_helper'

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get home_page_Index_url
    assert_response :success
  end

end
