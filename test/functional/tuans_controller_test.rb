require 'test_helper'

class TuansControllerTest < ActionController::TestCase
  setup do
    @tuan = tuans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tuans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tuan" do
    assert_difference('Tuan.count') do
      post :create, :tuan => @tuan.attributes
    end

    assert_redirected_to tuan_path(assigns(:tuan))
  end

  test "should show tuan" do
    get :show, :id => @tuan.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tuan.to_param
    assert_response :success
  end

  test "should update tuan" do
    put :update, :id => @tuan.to_param, :tuan => @tuan.attributes
    assert_redirected_to tuan_path(assigns(:tuan))
  end

  test "should destroy tuan" do
    assert_difference('Tuan.count', -1) do
      delete :destroy, :id => @tuan.to_param
    end

    assert_redirected_to tuans_path
  end
end
