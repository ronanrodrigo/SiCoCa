require 'test_helper'

class CarroSomsControllerTest < ActionController::TestCase
  setup do
    @carro_som = carro_soms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carro_soms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carro_som" do
    assert_difference('CarroSom.count') do
      post :create, :carro_som => @carro_som.attributes
    end

    assert_redirected_to carro_som_path(assigns(:carro_som))
  end

  test "should show carro_som" do
    get :show, :id => @carro_som.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @carro_som.to_param
    assert_response :success
  end

  test "should update carro_som" do
    put :update, :id => @carro_som.to_param, :carro_som => @carro_som.attributes
    assert_redirected_to carro_som_path(assigns(:carro_som))
  end

  test "should destroy carro_som" do
    assert_difference('CarroSom.count', -1) do
      delete :destroy, :id => @carro_som.to_param
    end

    assert_redirected_to carro_soms_path
  end
end
