require "test_helper"

class FavorisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get favoris_new_url
    assert_response :success
  end
end
