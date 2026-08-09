require "test_helper"

class Admin::MaterialsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_materials_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_materials_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_materials_edit_url
    assert_response :success
  end

  test "should get add" do
    get admin_materials_add_url
    assert_response :success
  end
end
