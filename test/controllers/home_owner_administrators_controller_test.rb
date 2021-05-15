require 'test_helper'

class HomeOwnerAdministratorsControllerTest < ActionController::TestCase
  setup do
    @home_owner_administrator = home_owner_administrators(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_owner_administrators)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_owner_administrator" do
    assert_difference('HomeOwnerAdministrator.count') do
      post :create, home_owner_administrator: { email: @home_owner_administrator.email, mobile: @home_owner_administrator.mobile, name: @home_owner_administrator.name }
    end

    assert_redirected_to home_owner_administrator_path(assigns(:home_owner_administrator))
  end

  test "should show home_owner_administrator" do
    get :show, id: @home_owner_administrator
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_owner_administrator
    assert_response :success
  end

  test "should update home_owner_administrator" do
    patch :update, id: @home_owner_administrator, home_owner_administrator: { email: @home_owner_administrator.email, mobile: @home_owner_administrator.mobile, name: @home_owner_administrator.name }
    assert_redirected_to home_owner_administrator_path(assigns(:home_owner_administrator))
  end

  test "should destroy home_owner_administrator" do
    assert_difference('HomeOwnerAdministrator.count', -1) do
      delete :destroy, id: @home_owner_administrator
    end

    assert_redirected_to home_owner_administrators_path
  end
end
