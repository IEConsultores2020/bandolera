require 'test_helper'

class AppliancesControllerTest < ActionController::TestCase
  setup do
    @appliance = appliances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appliances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appliance" do
    assert_difference('Appliance.count') do
      post :create, appliance: { acquisition_date: @appliance.acquisition_date, active: @appliance.active, contact_email: @appliance.contact_email, contact_number: @appliance.contact_number, description_string: @appliance.description_string, gadget_id: @appliance.gadget_id, property_id: @appliance.property_id, warranty: @appliance.warranty }
    end

    assert_redirected_to appliance_path(assigns(:appliance))
  end

  test "should show appliance" do
    get :show, id: @appliance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appliance
    assert_response :success
  end

  test "should update appliance" do
    patch :update, id: @appliance, appliance: { acquisition_date: @appliance.acquisition_date, active: @appliance.active, contact_email: @appliance.contact_email, contact_number: @appliance.contact_number, description_string: @appliance.description_string, gadget_id: @appliance.gadget_id, property_id: @appliance.property_id, warranty: @appliance.warranty }
    assert_redirected_to appliance_path(assigns(:appliance))
  end

  test "should destroy appliance" do
    assert_difference('Appliance.count', -1) do
      delete :destroy, id: @appliance
    end

    assert_redirected_to appliances_path
  end
end
