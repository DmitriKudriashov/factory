require 'test_helper'

class UsingtypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usingtype = usingtypes(:one)
  end

  test "should get index" do
    get usingtypes_url
    assert_response :success
  end

  test "should get new" do
    get new_usingtype_url
    assert_response :success
  end

  test "should create usingtype" do
    assert_difference('Usingtype.count') do
      post usingtypes_url, params: { usingtype: {  } }
    end

    assert_redirected_to usingtype_url(Usingtype.last)
  end

  test "should show usingtype" do
    get usingtype_url(@usingtype)
    assert_response :success
  end

  test "should get edit" do
    get edit_usingtype_url(@usingtype)
    assert_response :success
  end

  test "should update usingtype" do
    patch usingtype_url(@usingtype), params: { usingtype: {  } }
    assert_redirected_to usingtype_url(@usingtype)
  end

  test "should destroy usingtype" do
    assert_difference('Usingtype.count', -1) do
      delete usingtype_url(@usingtype)
    end

    assert_redirected_to usingtypes_url
  end
end
