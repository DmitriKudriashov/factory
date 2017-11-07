require 'test_helper'

class ModelsetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @modelset = modelsets(:one)
  end

  test "should get index" do
    get modelsets_url
    assert_response :success
  end

  test "should get new" do
    get new_modelset_url
    assert_response :success
  end

  test "should create modelset" do
    assert_difference('Modelset.count') do
      post modelsets_url, params: { modelset: { date_model: @modelset.date_model, number_model: @modelset.number_model, product_id: @modelset.product_id } }
    end

    assert_redirected_to modelset_url(Modelset.last)
  end

  test "should show modelset" do
    get modelset_url(@modelset)
    assert_response :success
  end

  test "should get edit" do
    get edit_modelset_url(@modelset)
    assert_response :success
  end

  test "should update modelset" do
    patch modelset_url(@modelset), params: { modelset: { date_model: @modelset.date_model, number_model: @modelset.number_model, product_id: @modelset.product_id } }
    assert_redirected_to modelset_url(@modelset)
  end

  test "should destroy modelset" do
    assert_difference('Modelset.count', -1) do
      delete modelset_url(@modelset)
    end

    assert_redirected_to modelsets_url
  end
end
