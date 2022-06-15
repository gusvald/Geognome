require "test_helper"

class GnomesProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gnomes_profile = gnomes_profiles(:one)
  end

  test "should get index" do
    get gnomes_profiles_url
    assert_response :success
  end

  test "should get new" do
    get new_gnomes_profile_url
    assert_response :success
  end

  test "should create gnomes_profile" do
    assert_difference("GnomesProfile.count") do
      post gnomes_profiles_url, params: { gnomes_profile: {  } }
    end

    assert_redirected_to gnomes_profile_url(GnomesProfile.last)
  end

  test "should show gnomes_profile" do
    get gnomes_profile_url(@gnomes_profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_gnomes_profile_url(@gnomes_profile)
    assert_response :success
  end

  test "should update gnomes_profile" do
    patch gnomes_profile_url(@gnomes_profile), params: { gnomes_profile: {  } }
    assert_redirected_to gnomes_profile_url(@gnomes_profile)
  end

  test "should destroy gnomes_profile" do
    assert_difference("GnomesProfile.count", -1) do
      delete gnomes_profile_url(@gnomes_profile)
    end

    assert_redirected_to gnomes_profiles_url
  end
end
