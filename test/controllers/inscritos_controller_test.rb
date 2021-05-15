require 'test_helper'

class InscritosControllerTest < ActionController::TestCase
  setup do
    @inscrito = inscritos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:inscritos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create inscrito" do
    assert_difference('Inscrito.count') do
      post :create, inscrito: { empresa_id: @inscrito.empresa_id, user_id: @inscrito.user_id }
    end

    assert_redirected_to inscrito_path(assigns(:inscrito))
  end

  test "should show inscrito" do
    get :show, id: @inscrito
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @inscrito
    assert_response :success
  end

  test "should update inscrito" do
    patch :update, id: @inscrito, inscrito: { empresa_id: @inscrito.empresa_id, user_id: @inscrito.user_id }
    assert_redirected_to inscrito_path(assigns(:inscrito))
  end

  test "should destroy inscrito" do
    assert_difference('Inscrito.count', -1) do
      delete :destroy, id: @inscrito
    end

    assert_redirected_to inscritos_path
  end
end
