require 'test_helper'

class BudgetitemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budgetitem = budgetitems(:one)
  end

  test "should get index" do
    get budgetitems_url
    assert_response :success
  end

  test "should get new" do
    get new_budgetitem_url
    assert_response :success
  end

  test "should create budgetitem" do
    assert_difference('Budgetitem.count') do
      post budgetitems_url, params: { budgetitem: { name: @budgetitem.name, codeitem: @budgetitem.codeitem } }
    end

    assert_redirected_to budgetitem_url(Budgetitem.last)
  end

  test "should show budgetitem" do
    get budgetitem_url(@budgetitem)
    assert_response :success
  end

  test "should get edit" do
    get edit_budgetitem_url(@budgetitem)
    assert_response :success
  end

  test "should update budgetitem" do
    patch budgetitem_url(@budgetitem), params: { budgetitem: { name: @budgetitem.name, codeitem: @budgetitem.codeitem } }
    assert_redirected_to budgetitem_url(@budgetitem)
  end

  test "should destroy budgetitem" do
    assert_difference('Budgetitem.count', -1) do
      delete budgetitem_url(@budgetitem)
    end

    assert_redirected_to budgetitems_url
  end
end
