require "test_helper"

class KategorisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @kategori = kategoris(:one)
  end

  test "should get index" do
    get kategoris_url
    assert_response :success
  end

  test "should get new" do
    get new_kategori_url
    assert_response :success
  end

  test "should create kategori" do
    assert_difference("Kategori.count") do
      post kategoris_url, params: { kategori: { jenis: @kategori.jenis, name: @kategori.name, origin: @kategori.origin } }
    end

    assert_redirected_to kategori_url(Kategori.last)
  end

  test "should show kategori" do
    get kategori_url(@kategori)
    assert_response :success
  end

  test "should get edit" do
    get edit_kategori_url(@kategori)
    assert_response :success
  end

  test "should update kategori" do
    patch kategori_url(@kategori), params: { kategori: { jenis: @kategori.jenis, name: @kategori.name, origin: @kategori.origin } }
    assert_redirected_to kategori_url(@kategori)
  end

  test "should destroy kategori" do
    assert_difference("Kategori.count", -1) do
      delete kategori_url(@kategori)
    end

    assert_redirected_to kategoris_url
  end
end
