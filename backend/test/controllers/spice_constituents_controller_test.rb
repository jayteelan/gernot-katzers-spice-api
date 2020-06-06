require 'test_helper'

class SpiceConstituentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spice_constituent = spice_constituents(:one)
  end

  test "should get index" do
    get spice_constituents_url, as: :json
    assert_response :success
  end

  test "should create spice_constituent" do
    assert_difference('SpiceConstituent.count') do
      post spice_constituents_url, params: { spice_constituent: { amount: @spice_constituent.amount, constituent_id: @spice_constituent.constituent_id, spice_id: @spice_constituent.spice_id } }, as: :json
    end

    assert_response 201
  end

  test "should show spice_constituent" do
    get spice_constituent_url(@spice_constituent), as: :json
    assert_response :success
  end

  test "should update spice_constituent" do
    patch spice_constituent_url(@spice_constituent), params: { spice_constituent: { amount: @spice_constituent.amount, constituent_id: @spice_constituent.constituent_id, spice_id: @spice_constituent.spice_id } }, as: :json
    assert_response 200
  end

  test "should destroy spice_constituent" do
    assert_difference('SpiceConstituent.count', -1) do
      delete spice_constituent_url(@spice_constituent), as: :json
    end

    assert_response 204
  end
end
