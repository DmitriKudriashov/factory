require 'test_helper'

class ModelpricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modelprice = modelprices(:one)
  end

  test "should get index" do
    get modelprices_url
    assert_response :success
  end

  test "should get new" do
    get new_modelprice_url
    assert_response :success
  end

  test "should create modelprice" do
    assert_difference('Modelprice.count') do
      post modelprices_url, params: { modelprice: { Quantty: @modelprice.Quantty, sum_curry: @modelprice.sum_curry, sum_usd: @modelprice.sum_usd, UnitPrice: @modelprice.UnitPrice, category_id: @modelprice.category_id, currency_id: @modelprice.currency_id, description_id: @modelprice.description_id, modelsets_id: @modelprice.modelsets_id, ratecurry_id: @modelprice.ratecurry_id, unit_id: @modelprice.unit_id } }
    end

    assert_redirected_to modelprice_url(Modelprice.last)
  end

  test "should show modelprice" do
    get modelprice_url(@modelprice)
    assert_response :success
  end

  test "should get edit" do
    get edit_modelprice_url(@modelprice)
    assert_response :success
  end

  test "should update modelprice" do
    patch modelprice_url(@modelprice), params: { modelprice: { Quantty: @modelprice.Quantty, sum_curry: @modelprice.sum_curry, sum_usd: @modelprice.sum_usd, UnitPrice: @modelprice.UnitPrice, category_id: @modelprice.category_id, currency_id: @modelprice.currency_id, description_id: @modelprice.description_id, modelsets_id: @modelprice.modelsets_id, ratecurry_id: @modelprice.ratecurry_id, unit_id: @modelprice.unit_id } }
    assert_redirected_to modelprice_url(@modelprice)
  end

  test "should destroy modelprice" do
    assert_difference('Modelprice.count', -1) do
      delete modelprice_url(@modelprice)
    end

    assert_redirected_to modelprices_url
  end
end
