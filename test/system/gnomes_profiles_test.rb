require "application_system_test_case"

class GnomesProfilesTest < ApplicationSystemTestCase
  setup do
    @gnomes_profile = gnomes_profiles(:one)
  end

  test "visiting the index" do
    visit gnomes_profiles_url
    assert_selector "h1", text: "Gnomes profiles"
  end

  test "should create gnomes profile" do
    visit gnomes_profiles_url
    click_on "New gnomes profile"

    click_on "Create Gnomes profile"

    assert_text "Gnomes profile was successfully created"
    click_on "Back"
  end

  test "should update Gnomes profile" do
    visit gnomes_profile_url(@gnomes_profile)
    click_on "Edit this gnomes profile", match: :first

    click_on "Update Gnomes profile"

    assert_text "Gnomes profile was successfully updated"
    click_on "Back"
  end

  test "should destroy Gnomes profile" do
    visit gnomes_profile_url(@gnomes_profile)
    click_on "Destroy this gnomes profile", match: :first

    assert_text "Gnomes profile was successfully destroyed"
  end
end
