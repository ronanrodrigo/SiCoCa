require 'test_helper'

class PlacaCasasControllerTest < ActionController::TestCase
  setup do
    @placa_casa = placa_casas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placa_casas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placa_casa" do
    assert_difference('PlacaCasa.count') do
      post :create, :placa_casa => @placa_casa.attributes
    end

    assert_redirected_to placa_casa_path(assigns(:placa_casa))
  end

  test "should show placa_casa" do
    get :show, :id => @placa_casa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @placa_casa.to_param
    assert_response :success
  end

  test "should update placa_casa" do
    put :update, :id => @placa_casa.to_param, :placa_casa => @placa_casa.attributes
    assert_redirected_to placa_casa_path(assigns(:placa_casa))
  end

  test "should destroy placa_casa" do
    assert_difference('PlacaCasa.count', -1) do
      delete :destroy, :id => @placa_casa.to_param
    end

    assert_redirected_to placa_casas_path
  end
end
