require 'test_helper'

class CavaletesControllerTest < ActionController::TestCase
  setup do
    @cavalete = cavaletes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cavaletes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cavalete" do
    assert_difference('Cavalete.count') do
      post :create, :cavalete => @cavalete.attributes
    end

    assert_redirected_to cavalete_path(assigns(:cavalete))
  end

  test "should show cavalete" do
    get :show, :id => @cavalete.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cavalete.to_param
    assert_response :success
  end

  test "should update cavalete" do
    put :update, :id => @cavalete.to_param, :cavalete => @cavalete.attributes
    assert_redirected_to cavalete_path(assigns(:cavalete))
  end

  test "should destroy cavalete" do
    assert_difference('Cavalete.count', -1) do
      delete :destroy, :id => @cavalete.to_param
    end

    assert_redirected_to cavaletes_path
  end
end
