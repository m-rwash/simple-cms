require 'test_helper'

class AdminUsersControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_users_controller_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_users_controller_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_users_controller_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_users_controller_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_users_controller_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_users_controller_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_users_controller_destroy_url
    assert_response :success
  end

end
