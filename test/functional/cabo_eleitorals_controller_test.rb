require 'test_helper'

class CaboEleitoralsControllerTest < ActionController::TestCase
  setup do
    @cabo_eleitoral = cabo_eleitorals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cabo_eleitorals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cabo_eleitoral" do
    assert_difference('CaboEleitoral.count') do
      post :create, :cabo_eleitoral => @cabo_eleitoral.attributes
    end

    assert_redirected_to cabo_eleitoral_path(assigns(:cabo_eleitoral))
  end

  test "should show cabo_eleitoral" do
    get :show, :id => @cabo_eleitoral.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cabo_eleitoral.to_param
    assert_response :success
  end

  test "should update cabo_eleitoral" do
    put :update, :id => @cabo_eleitoral.to_param, :cabo_eleitoral => @cabo_eleitoral.attributes
    assert_redirected_to cabo_eleitoral_path(assigns(:cabo_eleitoral))
  end

  test "should destroy cabo_eleitoral" do
    assert_difference('CaboEleitoral.count', -1) do
      delete :destroy, :id => @cabo_eleitoral.to_param
    end

    assert_redirected_to cabo_eleitorals_path
  end
end
