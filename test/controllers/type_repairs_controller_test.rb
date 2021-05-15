require 'test_helper'

class TypeRepairsControllerTest < ActionController::TestCase
  setup do
    @type_repair = type_repairs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:type_repairs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create type_repair" do
    assert_difference('TypeRepair.count') do
      post :create, type_repair: { description: @type_repair.description, name: @type_repair.name }
    end

    assert_redirected_to type_repair_path(assigns(:type_repair))
  end

  test "should show type_repair" do
    get :show, id: @type_repair
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @type_repair
    assert_response :success
  end

  test "should update type_repair" do
    patch :update, id: @type_repair, type_repair: { description: @type_repair.description, name: @type_repair.name }
    assert_redirected_to type_repair_path(assigns(:type_repair))
  end

  test "should destroy type_repair" do
    assert_difference('TypeRepair.count', -1) do
      delete :destroy, id: @type_repair
    end

    assert_redirected_to type_repairs_path
  end
end
