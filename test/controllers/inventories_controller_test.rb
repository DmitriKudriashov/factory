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
      post inventories_url, params: { inventory: { price_curry: @inventory.price_curry, price_usd: @inventory.price_usd, quantity: @inventory.quantity, serial_number: @inventory.serial_number, sum_curry: @inventory.sum_curry, sum_usd: @inventory.sum_usd, brand_id: @inventory.brand_id, budgetitem_id: @inventory.budgetitem_id, currency_id: @inventory.currency_id, description_id: @inventory.description_id, ratecurry_id: @inventory.ratecurry_id, supplier_id: @inventory.supplier_id, unit_id: @inventory.unit_id } }
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
    patch inventory_url(@inventory), params: { inventory: { price_curry: @inventory.price_curry, price_usd: @inventory.price_usd, quantity: @inventory.quantity, serial_number: @inventory.serial_number, sum_curry: @inventory.sum_curry, sum_usd: @inventory.sum_usd, brand_id: @inventory.brand_id, budgetitem_id: @inventory.budgetitem_id, currency_id: @inventory.currency_id, description_id: @inventory.description_id, ratecurry_id: @inventory.ratecurry_id, supplier_id: @inventory.supplier_id, unit_id: @inventory.unit_id } }
    assert_redirected_to inventory_url(@inventory)
  end

  test "should destroy inventory" do
    assert_difference('Inventory.count', -1) do
      delete inventory_url(@inventory)
    end

    assert_redirected_to inventories_url
  end
end
