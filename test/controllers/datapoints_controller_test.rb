require 'test_helper'

class DatapointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datapoint = datapoints(:one)
  end

  test "should get index" do
    get datapoints_url, as: :json
    assert_response :success
  end

  test "should create datapoint" do
    assert_difference('Datapoint.count') do
      post datapoints_url, params: { datapoint: { close: @datapoint.close, date: @datapoint.date, high: @datapoint.high, low: @datapoint.low, open: @datapoint.open, openint: @datapoint.openint, stock_id: @datapoint.stock_id, type: @datapoint.type, volume: @datapoint.volume } }, as: :json
    end

    assert_response 201
  end

  test "should show datapoint" do
    get datapoint_url(@datapoint), as: :json
    assert_response :success
  end

  test "should update datapoint" do
    patch datapoint_url(@datapoint), params: { datapoint: { close: @datapoint.close, date: @datapoint.date, high: @datapoint.high, low: @datapoint.low, open: @datapoint.open, openint: @datapoint.openint, stock_id: @datapoint.stock_id, type: @datapoint.type, volume: @datapoint.volume } }, as: :json
    assert_response 200
  end

  test "should destroy datapoint" do
    assert_difference('Datapoint.count', -1) do
      delete datapoint_url(@datapoint), as: :json
    end

    assert_response 204
  end
end
