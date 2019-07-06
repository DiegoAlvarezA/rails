require "application_system_test_case"

class LineaItemsTest < ApplicationSystemTestCase
  setup do
    @linea_item = linea_items(:one)
  end

  test "visiting the index" do
    visit linea_items_url
    assert_selector "h1", text: "Linea Items"
  end

  test "creating a Linea item" do
    visit linea_items_url
    click_on "New Linea Item"

    fill_in "Order", with: @linea_item.order_id
    fill_in "Product", with: @linea_item.product_id
    click_on "Create Linea item"

    assert_text "Linea item was successfully created"
    click_on "Back"
  end

  test "updating a Linea item" do
    visit linea_items_url
    click_on "Edit", match: :first

    fill_in "Order", with: @linea_item.order_id
    fill_in "Product", with: @linea_item.product_id
    click_on "Update Linea item"

    assert_text "Linea item was successfully updated"
    click_on "Back"
  end

  test "destroying a Linea item" do
    visit linea_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linea item was successfully destroyed"
  end
end
