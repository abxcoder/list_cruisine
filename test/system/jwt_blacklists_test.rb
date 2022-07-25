require "application_system_test_case"

class JwtBlacklistsTest < ApplicationSystemTestCase
  setup do
    @jwt_blacklist = jwt_blacklists(:one)
  end

  test "visiting the index" do
    visit jwt_blacklists_url
    assert_selector "h1", text: "Jwt blacklists"
  end

  test "should create jwt blacklist" do
    visit jwt_blacklists_url
    click_on "New jwt blacklist"

    fill_in "Jwt", with: @jwt_blacklist.jwt
    fill_in "User", with: @jwt_blacklist.user_id
    click_on "Create Jwt blacklist"

    assert_text "Jwt blacklist was successfully created"
    click_on "Back"
  end

  test "should update Jwt blacklist" do
    visit jwt_blacklist_url(@jwt_blacklist)
    click_on "Edit this jwt blacklist", match: :first

    fill_in "Jwt", with: @jwt_blacklist.jwt
    fill_in "User", with: @jwt_blacklist.user_id
    click_on "Update Jwt blacklist"

    assert_text "Jwt blacklist was successfully updated"
    click_on "Back"
  end

  test "should destroy Jwt blacklist" do
    visit jwt_blacklist_url(@jwt_blacklist)
    click_on "Destroy this jwt blacklist", match: :first

    assert_text "Jwt blacklist was successfully destroyed"
  end
end
