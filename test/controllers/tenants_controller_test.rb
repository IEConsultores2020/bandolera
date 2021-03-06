require 'test_helper'

class TenantsControllerTest < ActionController::TestCase
  setup do
    @tenant = tenants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tenants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tenant" do
    assert_difference('Tenant.count') do
      post :create, tenant: { begin_date: @tenant.begin_date, email: @tenant.email, end_date: @tenant.end_date, leasing: @tenant.leasing, monthly_administration: @tenant.monthly_administration, monthly_rent: @tenant.monthly_rent, name: @tenant.name, phone: @tenant.phone, property_id: @tenant.property_id, user_id: @tenant.user_id }
    end

    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should show tenant" do
    get :show, id: @tenant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tenant
    assert_response :success
  end

  test "should update tenant" do
    patch :update, id: @tenant, tenant: { begin_date: @tenant.begin_date, email: @tenant.email, end_date: @tenant.end_date, leasing: @tenant.leasing, monthly_administration: @tenant.monthly_administration, monthly_rent: @tenant.monthly_rent, name: @tenant.name, phone: @tenant.phone, property_id: @tenant.property_id, user_id: @tenant.user_id }
    assert_redirected_to tenant_path(assigns(:tenant))
  end

  test "should destroy tenant" do
    assert_difference('Tenant.count', -1) do
      delete :destroy, id: @tenant
    end

    assert_redirected_to tenants_path
  end
end
