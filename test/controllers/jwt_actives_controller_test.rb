require "test_helper"

class JwtActivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jwt_active = jwt_actives(:one)
  end

  test "should get index" do
    get jwt_actives_url
    assert_response :success
  end

  test "should get new" do
    get new_jwt_active_url
    assert_response :success
  end

  test "should create jwt_active" do
    assert_difference("JwtActive.count") do
      post jwt_actives_url, params: { jwt_active: { jwt: @jwt_active.jwt, user_id: @jwt_active.user_id } }
    end

    assert_redirected_to jwt_active_url(JwtActive.last)
  end

  test "should show jwt_active" do
    get jwt_active_url(@jwt_active)
    assert_response :success
  end

  test "should get edit" do
    get edit_jwt_active_url(@jwt_active)
    assert_response :success
  end

  test "should update jwt_active" do
    patch jwt_active_url(@jwt_active), params: { jwt_active: { jwt: @jwt_active.jwt, user_id: @jwt_active.user_id } }
    assert_redirected_to jwt_active_url(@jwt_active)
  end

  test "should destroy jwt_active" do
    assert_difference("JwtActive.count", -1) do
      delete jwt_active_url(@jwt_active)
    end

    assert_redirected_to jwt_actives_url
  end
end
