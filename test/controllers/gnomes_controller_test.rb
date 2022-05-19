require "test_helper"

class GnomesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gnome = gnomes(:one)
  end

  test "should get index" do
    get gnomes_url
    assert_response :success
  end

  test "should get new" do
    get new_gnome_url
    assert_response :success
  end

  test "should create gnome" do
    assert_difference("Gnome.count") do
      post gnomes_url, params: { gnome: { g_description: @gnome.g_description, gnome_name: @gnome.gnome_name, location_x: @gnome.location_x, location_y: @gnome.location_y, route_id: @gnome.route_id } }
    end

    assert_redirected_to gnome_url(Gnome.last)
  end

  test "should show gnome" do
    get gnome_url(@gnome)
    assert_response :success
  end

  test "should get edit" do
    get edit_gnome_url(@gnome)
    assert_response :success
  end

  test "should update gnome" do
    patch gnome_url(@gnome), params: { gnome: { g_description: @gnome.g_description, gnome_name: @gnome.gnome_name, location_x: @gnome.location_x, location_y: @gnome.location_y, route_id: @gnome.route_id } }
    assert_redirected_to gnome_url(@gnome)
  end

  test "should destroy gnome" do
    assert_difference("Gnome.count", -1) do
      delete gnome_url(@gnome)
    end

    assert_redirected_to gnomes_url
  end
end
