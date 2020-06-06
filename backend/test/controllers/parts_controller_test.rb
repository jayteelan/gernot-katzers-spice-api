require 'test_helper'

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test "should get index" do
    get parts_url, as: :json
    assert_response :success
  end

  test "should create part" do
    assert_difference('Part.count') do
      post parts_url, params: { part: { part: @part.part, spice_id: @part.spice_id } }, as: :json
    end

    assert_response 201
  end

  test "should show part" do
    get part_url(@part), as: :json
    assert_response :success
  end

  test "should update part" do
    patch part_url(@part), params: { part: { part: @part.part, spice_id: @part.spice_id } }, as: :json
    assert_response 200
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete part_url(@part), as: :json
    end

    assert_response 204
  end
end
