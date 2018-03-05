require 'test_helper'


class EquipmentmodelControllerTest < ActionDispatch::IntegrationTest
  setup do
    @equipmentmodel = equipmentmodels(:one)
  end

  test "should get index" do
    get  equipmentmodels_url   # kds 050318 equipment_index_url
    assert_response :success
  end

  test "should get new" do
    get new_equipmentmodel_url
    assert_response :success
  end

  test "should create equipmentmodel" do
    assert_difference('equipmentmodel.count') do
# kds 050318      post equipment_index_url, params: { equipmentmodel: { brand_id: @equipmentmodel.brand_id, name: @equipmentmodel.name } }
      post equipmentmodels_url, params: { equipmentmodel: { brand_id: @equipmentmodel.brand_id, name: @equipmentmodel.name } }
    end

    assert_redirected_to equipmentmodel_url(equipmentmodel.last)
  end

  test "should show equipmentmodel" do
    get equipmentmodel_url(@equipmentmodel)
    assert_response :success
  end

  test "should get edit" do
    get edit_equipmentmodel_url(@equipmentmodel)
    assert_response :success
  end

  test "should update equipmentmodel" do
    patch equipmentmodel_url(@equipmentmodel), params: { equipmentmodel: { brand_id: @equipmentmodel.brand_id, name: @equipmentmodel.name } }
    assert_redirected_to equipmentmodel_url(@equipmentmodel)
  end

  test "should destroy equipmentmodel" do
    assert_difference('equipmentmodel.count', -1) do
      delete equipmentmodel_url(@equipmentmodel)
    end

  #050318  assert_redirected_to equipmentmodel_index_url
    assert_redirected_to equipmentmodels_url
  end
end
