require 'test_helper'

class LineaItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linea_item = linea_items(:one)
  end

  test "should get index" do
    get linea_items_url
    assert_response :success
  end

  test "should get new" do
    get new_linea_item_url
    assert_response :success
  end

  test "should create linea_item" do
    assert_difference('LineaItem.count') do
      post linea_items_url, params: { linea_item: { order_id: @linea_item.order_id, product_id: @linea_item.product_id } }
    end

    assert_redirected_to linea_item_url(LineaItem.last)
  end

  test "should show linea_item" do
    get linea_item_url(@linea_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_linea_item_url(@linea_item)
    assert_response :success
  end

  test "should update linea_item" do
    patch linea_item_url(@linea_item), params: { linea_item: { order_id: @linea_item.order_id, product_id: @linea_item.product_id } }
    assert_redirected_to linea_item_url(@linea_item)
  end

  test "should destroy linea_item" do
    assert_difference('LineaItem.count', -1) do
      delete linea_item_url(@linea_item)
    end

    assert_redirected_to linea_items_url
  end
end
