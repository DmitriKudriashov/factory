require 'test_helper'

class RatecurriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ratecurry = ratecurries(:one)
  end

  test "should get index" do
    get ratecurries_url
    assert_response :success
  end

  test "should get new" do
    get new_ratecurry_url
    assert_response :success
  end

  test "should create ratecurry" do
    assert_difference('Ratecurry.count') do
      post ratecurries_url, params: { ratecurry: { currency_id: @ratecurry.currency_id, rate: @ratecurry.rate } }
    end

    assert_redirected_to ratecurry_url(Ratecurry.last)
  end

  test "should show ratecurry" do
    get ratecurry_url(@ratecurry)
    assert_response :success
  end

  test "should get edit" do
    get edit_ratecurry_url(@ratecurry)
    assert_response :success
  end

  test "should update ratecurry" do
    patch ratecurry_url(@ratecurry), params: { ratecurry: { currency_id: @ratecurry.currency_id, rate: @ratecurry.rate } }
    assert_redirected_to ratecurry_url(@ratecurry)
  end

  test "should destroy ratecurry" do
    assert_difference('Ratecurry.count', -1) do
      delete ratecurry_url(@ratecurry)
    end

    assert_redirected_to ratecurries_url
  end
end
