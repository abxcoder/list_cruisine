require "application_system_test_case"

class JwtActivesTest < ApplicationSystemTestCase
  setup do
    @jwt_active = jwt_actives(:one)
  end

  test "visiting the index" do
    visit jwt_actives_url
    assert_selector "h1", text: "Jwt actives"
  end

  test "should create jwt active" do
    visit jwt_actives_url
    click_on "New jwt active"

    fill_in "Jwt", with: @jwt_active.jwt
    fill_in "User", with: @jwt_active.user_id
    click_on "Create Jwt active"

    assert_text "Jwt active was successfully created"
    click_on "Back"
  end

  test "should update Jwt active" do
    visit jwt_active_url(@jwt_active)
    click_on "Edit this jwt active", match: :first

    fill_in "Jwt", with: @jwt_active.jwt
    fill_in "User", with: @jwt_active.user_id
    click_on "Update Jwt active"

    assert_text "Jwt active was successfully updated"
    click_on "Back"
  end

  test "should destroy Jwt active" do
    visit jwt_active_url(@jwt_active)
    click_on "Destroy this jwt active", match: :first

    assert_text "Jwt active was successfully destroyed"
  end
end
