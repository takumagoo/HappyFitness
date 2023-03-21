require "test_helper"

class Public::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get public_menus_show_url
    assert_response :success
  end
end
