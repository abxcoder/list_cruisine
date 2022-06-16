require "test_helper"

class RestoransControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restoran = restorans(:one)
  end

  test "should get index" do
    get restorans_url
    assert_response :success
  end

  test "should get new" do
    get new_restoran_url
    assert_response :success
  end

  test "should create restoran" do
    assert_difference("Restoran.count") do
      post restorans_url, params: { restoran: { alamat: @restoran.alamat, city: @restoran.city, image: @restoran.image, name: @restoran.name, phone: @restoran.phone } }
    end

    assert_redirected_to restoran_url(Restoran.last)
  end

  test "should show restoran" do
    get restoran_url(@restoran)
    assert_response :success
  end

  test "should get edit" do
    get edit_restoran_url(@restoran)
    assert_response :success
  end

  test "should update restoran" do
    patch restoran_url(@restoran), params: { restoran: { alamat: @restoran.alamat, city: @restoran.city, image: @restoran.image, name: @restoran.name, phone: @restoran.phone } }
    assert_redirected_to restoran_url(@restoran)
  end

  test "should destroy restoran" do
    assert_difference("Restoran.count", -1) do
      delete restoran_url(@restoran)
    end

    assert_redirected_to restorans_url
  end
end
