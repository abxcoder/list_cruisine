require "application_system_test_case"

class KategorisTest < ApplicationSystemTestCase
  setup do
    @kategori = kategoris(:one)
  end

  test "visiting the index" do
    visit kategoris_url
    assert_selector "h1", text: "Kategoris"
  end

  test "should create kategori" do
    visit kategoris_url
    click_on "New kategori"

    fill_in "Jenis", with: @kategori.jenis
    fill_in "Name", with: @kategori.name
    fill_in "Origin", with: @kategori.origin
    click_on "Create Kategori"

    assert_text "Kategori was successfully created"
    click_on "Back"
  end

  test "should update Kategori" do
    visit kategori_url(@kategori)
    click_on "Edit this kategori", match: :first

    fill_in "Jenis", with: @kategori.jenis
    fill_in "Name", with: @kategori.name
    fill_in "Origin", with: @kategori.origin
    click_on "Update Kategori"

    assert_text "Kategori was successfully updated"
    click_on "Back"
  end

  test "should destroy Kategori" do
    visit kategori_url(@kategori)
    click_on "Destroy this kategori", match: :first

    assert_text "Kategori was successfully destroyed"
  end
end
