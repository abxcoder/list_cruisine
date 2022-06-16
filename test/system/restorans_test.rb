require "application_system_test_case"

class RestoransTest < ApplicationSystemTestCase
  setup do
    @restoran = restorans(:one)
  end

  test "visiting the index" do
    visit restorans_url
    assert_selector "h1", text: "Restorans"
  end

  test "should create restoran" do
    visit restorans_url
    click_on "New restoran"

    fill_in "Alamat", with: @restoran.alamat
    fill_in "City", with: @restoran.city
    fill_in "Image", with: @restoran.image
    fill_in "Name", with: @restoran.name
    fill_in "Phone", with: @restoran.phone
    click_on "Create Restoran"

    assert_text "Restoran was successfully created"
    click_on "Back"
  end

  test "should update Restoran" do
    visit restoran_url(@restoran)
    click_on "Edit this restoran", match: :first

    fill_in "Alamat", with: @restoran.alamat
    fill_in "City", with: @restoran.city
    fill_in "Image", with: @restoran.image
    fill_in "Name", with: @restoran.name
    fill_in "Phone", with: @restoran.phone
    click_on "Update Restoran"

    assert_text "Restoran was successfully updated"
    click_on "Back"
  end

  test "should destroy Restoran" do
    visit restoran_url(@restoran)
    click_on "Destroy this restoran", match: :first

    assert_text "Restoran was successfully destroyed"
  end
end
