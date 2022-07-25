require "test_helper"

class JwtBlacklistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jwt_blacklist = jwt_blacklists(:one)
  end

  test "should get index" do
    get jwt_blacklists_url
    assert_response :success
  end

  test "should get new" do
    get new_jwt_blacklist_url
    assert_response :success
  end

  test "should create jwt_blacklist" do
    assert_difference("JwtBlacklist.count") do
      post jwt_blacklists_url, params: { jwt_blacklist: { jwt: @jwt_blacklist.jwt, user_id: @jwt_blacklist.user_id } }
    end

    assert_redirected_to jwt_blacklist_url(JwtBlacklist.last)
  end

  test "should show jwt_blacklist" do
    get jwt_blacklist_url(@jwt_blacklist)
    assert_response :success
  end

  test "should get edit" do
    get edit_jwt_blacklist_url(@jwt_blacklist)
    assert_response :success
  end

  test "should update jwt_blacklist" do
    patch jwt_blacklist_url(@jwt_blacklist), params: { jwt_blacklist: { jwt: @jwt_blacklist.jwt, user_id: @jwt_blacklist.user_id } }
    assert_redirected_to jwt_blacklist_url(@jwt_blacklist)
  end

  test "should destroy jwt_blacklist" do
    assert_difference("JwtBlacklist.count", -1) do
      delete jwt_blacklist_url(@jwt_blacklist)
    end

    assert_redirected_to jwt_blacklists_url
  end
end
