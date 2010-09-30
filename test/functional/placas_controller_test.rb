require 'test_helper'

class PlacasControllerTest < ActionController::TestCase
  setup do
    @placa = placas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placa" do
    assert_difference('Placa.count') do
      post :create, :placa => @placa.attributes
    end

    assert_redirected_to placa_path(assigns(:placa))
  end

  test "should show placa" do
    get :show, :id => @placa.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @placa.to_param
    assert_response :success
  end

  test "should update placa" do
    put :update, :id => @placa.to_param, :placa => @placa.attributes
    assert_redirected_to placa_path(assigns(:placa))
  end

  test "should destroy placa" do
    assert_difference('Placa.count', -1) do
      delete :destroy, :id => @placa.to_param
    end

    assert_redirected_to placas_path
  end
end
