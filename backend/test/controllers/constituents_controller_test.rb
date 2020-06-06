require 'test_helper'

class ConstituentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @constituent = constituents(:one)
  end

  test "should get index" do
    get constituents_url, as: :json
    assert_response :success
  end

  test "should create constituent" do
    assert_difference('Constituent.count') do
      post constituents_url, params: { constituent: { compound: @constituent.compound, description: @constituent.description, spice_id: @constituent.spice_id } }, as: :json
    end

    assert_response 201
  end

  test "should show constituent" do
    get constituent_url(@constituent), as: :json
    assert_response :success
  end

  test "should update constituent" do
    patch constituent_url(@constituent), params: { constituent: { compound: @constituent.compound, description: @constituent.description, spice_id: @constituent.spice_id } }, as: :json
    assert_response 200
  end

  test "should destroy constituent" do
    assert_difference('Constituent.count', -1) do
      delete constituent_url(@constituent), as: :json
    end

    assert_response 204
  end
end
