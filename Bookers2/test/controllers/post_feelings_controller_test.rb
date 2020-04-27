require 'test_helper'

class PostFeelingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get post_feelings_index_url
    assert_response :success
  end

end
