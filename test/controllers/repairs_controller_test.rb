require 'test_helper'

class RepairsControllerTest < ActionController::TestCase
  setup do
    @repair = repairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:repairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create repair" do
    assert_difference('Repair.count') do
      post :create, repair: { cost: @repair.cost, date_repair: @repair.date_repair, details: @repair.details, email: @repair.email, manpower_name: @repair.manpower_name, phone: @repair.phone, property_id: @repair.property_id, type_repair_id: @repair.type_repair_id, user_id: @repair.user_id, warranty: @repair.warranty }
    end

    assert_redirected_to repair_path(assigns(:repair))
  end

  test "should show repair" do
    get :show, id: @repair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @repair
    assert_response :success
  end

  test "should update repair" do
    patch :update, id: @repair, repair: { cost: @repair.cost, date_repair: @repair.date_repair, details: @repair.details, email: @repair.email, manpower_name: @repair.manpower_name, phone: @repair.phone, property_id: @repair.property_id, type_repair_id: @repair.type_repair_id, user_id: @repair.user_id, warranty: @repair.warranty }
    assert_redirected_to repair_path(assigns(:repair))
  end

  test "should destroy repair" do
    assert_difference('Repair.count', -1) do
      delete :destroy, id: @repair
    end

    assert_redirected_to repairs_path
  end
end
