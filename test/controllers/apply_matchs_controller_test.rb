require 'test_helper'

class ApplyMatchsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get apply_matchs_new_url
    assert_response :success
  end

end
