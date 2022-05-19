require "application_system_test_case"

class GnomesTest < ApplicationSystemTestCase
  setup do
    @gnome = gnomes(:one)
  end

  test "visiting the index" do
    visit gnomes_url
    assert_selector "h1", text: "Gnomes"
  end

  test "should create gnome" do
    visit gnomes_url
    click_on "New gnome"

    fill_in "G description", with: @gnome.g_description
    fill_in "Gnome name", with: @gnome.gnome_name
    fill_in "Location x", with: @gnome.location_x
    fill_in "Location y", with: @gnome.location_y
    fill_in "Route", with: @gnome.route_id
    click_on "Create Gnome"

    assert_text "Gnome was successfully created"
    click_on "Back"
  end

  test "should update Gnome" do
    visit gnome_url(@gnome)
    click_on "Edit this gnome", match: :first

    fill_in "G description", with: @gnome.g_description
    fill_in "Gnome name", with: @gnome.gnome_name
    fill_in "Location x", with: @gnome.location_x
    fill_in "Location y", with: @gnome.location_y
    fill_in "Route", with: @gnome.route_id
    click_on "Update Gnome"

    assert_text "Gnome was successfully updated"
    click_on "Back"
  end

  test "should destroy Gnome" do
    visit gnome_url(@gnome)
    click_on "Destroy this gnome", match: :first

    assert_text "Gnome was successfully destroyed"
  end
end
