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
      post modelprices_url, params: { modelprice: { Quantty: @modelprice.Quantty, SumCurry: @modelprice.SumCurry, SumUsd: @modelprice.SumUsd, UnitPrice: @modelprice.UnitPrice, categories_id: @modelprice.categories_id, currencies_id: @modelprice.currencies_id, descriptions_id: @modelprice.descriptions_id, modelsets_id: @modelprice.modelsets_id, ratecurries_id: @modelprice.ratecurries_id, units_id: @modelprice.units_id } }
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
    patch modelprice_url(@modelprice), params: { modelprice: { Quantty: @modelprice.Quantty, SumCurry: @modelprice.SumCurry, SumUsd: @modelprice.SumUsd, UnitPrice: @modelprice.UnitPrice, categories_id: @modelprice.categories_id, currencies_id: @modelprice.currencies_id, descriptions_id: @modelprice.descriptions_id, modelsets_id: @modelprice.modelsets_id, ratecurries_id: @modelprice.ratecurries_id, units_id: @modelprice.units_id } }
    assert_redirected_to modelprice_url(@modelprice)
  end

  test "should destroy modelprice" do
    assert_difference('Modelprice.count', -1) do
      delete modelprice_url(@modelprice)
    end

    assert_redirected_to modelprices_url
  end
end
