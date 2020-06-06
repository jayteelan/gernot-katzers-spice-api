require 'test_helper'

class FamiliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @family = families(:one)
  end

  test "should get index" do
    get families_url, as: :json
    assert_response :success
  end

  test "should create family" do
    assert_difference('Family.count') do
      post families_url, params: { family: { description: @family.description, name: @family.name, spice_id: @family.spice_id } }, as: :json
    end

    assert_response 201
  end

  test "should show family" do
    get family_url(@family), as: :json
    assert_response :success
  end

  test "should update family" do
    patch family_url(@family), params: { family: { description: @family.description, name: @family.name, spice_id: @family.spice_id } }, as: :json
    assert_response 200
  end

  test "should destroy family" do
    assert_difference('Family.count', -1) do
      delete family_url(@family), as: :json
    end

    assert_response 204
  end
end
