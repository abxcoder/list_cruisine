require "application_system_test_case"

class ImeiActivesTest < ApplicationSystemTestCase
  setup do
    @imei_active = imei_actives(:one)
  end

  test "visiting the index" do
    visit imei_actives_url
    assert_selector "h1", text: "Imei actives"
  end

  test "should create imei active" do
    visit imei_actives_url
    click_on "New imei active"

    fill_in "Number", with: @imei_active.number
    fill_in "Status", with: @imei_active.status
    fill_in "User", with: @imei_active.user_id
    click_on "Create Imei active"

    assert_text "Imei active was successfully created"
    click_on "Back"
  end

  test "should update Imei active" do
    visit imei_active_url(@imei_active)
    click_on "Edit this imei active", match: :first

    fill_in "Number", with: @imei_active.number
    fill_in "Status", with: @imei_active.status
    fill_in "User", with: @imei_active.user_id
    click_on "Update Imei active"

    assert_text "Imei active was successfully updated"
    click_on "Back"
  end

  test "should destroy Imei active" do
    visit imei_active_url(@imei_active)
    click_on "Destroy this imei active", match: :first

    assert_text "Imei active was successfully destroyed"
  end
end
