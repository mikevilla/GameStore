require 'test_helper'

class PlatformsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:platforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create platform" do
    assert_difference('Platform.count') do
      post :create, :platform => { }
    end

    assert_redirected_to platform_path(assigns(:platform))
  end

  test "should show platform" do
    get :show, :id => platforms(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => platforms(:one).to_param
    assert_response :success
  end

  test "should update platform" do
    put :update, :id => platforms(:one).to_param, :platform => { }
    assert_redirected_to platform_path(assigns(:platform))
  end

  test "should destroy platform" do
    assert_difference('Platform.count', -1) do
      delete :destroy, :id => platforms(:one).to_param
    end

    assert_redirected_to platforms_path
  end
end
