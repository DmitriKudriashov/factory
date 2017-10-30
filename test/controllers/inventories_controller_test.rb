require 'test_helper'

class InventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventory = inventories(:one)
  end

  test "should get index" do
    get inventories_url
    assert_response :success
  end

  test "should get new" do
    get new_inventory_url
    assert_response :success
  end

  test "should create inventory" do
    assert_difference('Inventory.count') do
      post inventories_url, params: { inventory: { PriceCurry: @inventory.PriceCurry, PriceUsd: @inventory.PriceUsd, Quantity: @inventory.Quantity, SerialNumber: @inventory.SerialNumber, SumCurry: @inventory.SumCurry, SumUsd: @inventory.SumUsd, brands_id: @inventory.brands_id, budgetsitems_id: @inventory.budgetsitems_id, currency_id: @inventory.currency_id, descriptions_id: @inventory.descriptions_id, ratecurries_id: @inventory.ratecurries_id, suppliers_id: @inventory.suppliers_id, units_id: @inventory.units_id } }
    end

    assert_redirected_to inventory_url(Inventory.last)
  end

  test "should show inventory" do
    get inventory_url(@inventory)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventory_url(@inventory)
    assert_response :success
  end

  test "should update inventory" do
    patch inventory_url(@inventory), params: { inventory: { PriceCurry: @inventory.PriceCurry, PriceUsd: @inventory.PriceUsd, Quantity: @inventory.Quantity, SerialNumber: @inventory.SerialNumber, SumCurry: @inventory.SumCurry, SumUsd: @inventory.SumUsd, brands_id: @inventory.brands_id, budgetsitems_id: @inventory.budgetsitems_id, currency_id: @inventory.currency_id, descriptions_id: @inventory.descriptions_id, ratecurries_id: @inventory.ratecurries_id, suppliers_id: @inventory.suppliers_id, units_id: @inventory.units_id } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
