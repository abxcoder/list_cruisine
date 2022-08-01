require "test_helper"

class ImeiActivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imei_active = imei_actives(:one)
  end

  test "should get index" do
    get imei_actives_url
    assert_response :success
  end

  test "should get new" do
    get new_imei_active_url
    assert_response :success
  end

  test "should create imei_active" do
    assert_difference("ImeiActive.count") do
      post imei_actives_url, params: { imei_active: { number: @imei_active.number, status: @imei_active.status, user_id: @imei_active.user_id } }
    end

    assert_redirected_to imei_active_url(ImeiActive.last)
  end

  test "should show imei_active" do
    get imei_active_url(@imei_active)
    assert_response :success
  end

  test "should get edit" do
    get edit_imei_active_url(@imei_active)
    assert_response :success
  end

  test "should update imei_active" do
    patch imei_active_url(@imei_active), params: { imei_active: { number: @imei_active.number, status: @imei_active.status, user_id: @imei_active.user_id } }
    assert_redirected_to imei_active_url(@imei_active)
  end

  test "should destroy imei_active" do
    assert_difference("ImeiActive.count", -1) do
      delete imei_active_url(@imei_active)
    end

    assert_redirected_to imei_actives_url
  end
end
