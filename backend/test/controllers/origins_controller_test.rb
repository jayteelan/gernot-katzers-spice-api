require 'test_helper'

class OriginsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @origin = origins(:one)
  end

  test "should get index" do
    get origins_url, as: :json
    assert_response :success
  end

  test "should create origin" do
    assert_difference('Origin.count') do
      post origins_url, params: { origin: { area: @origin.area, spice_id: @origin.spice_id } }, as: :json
    end

    assert_response 201
  end

  test "should show origin" do
    get origin_url(@origin), as: :json
    assert_response :success
  end

  test "should update origin" do
    patch origin_url(@origin), params: { origin: { area: @origin.area, spice_id: @origin.spice_id } }, as: :json
    assert_response 200
  end

  test "should destroy origin" do
    assert_difference('Origin.count', -1) do
      delete origin_url(@origin), as: :json
    end

    assert_response 204
  end
end
