require 'test_helper'

class PowerSocketsControllerTest < ActionController::TestCase
  setup do
    @power_socket = power_sockets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:power_sockets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create power_socket" do
    assert_difference('PowerSocket.count') do
      post :create, :power_socket => @power_socket.attributes
    end

    assert_redirected_to power_socket_path(assigns(:power_socket))
  end

  test "should show power_socket" do
    get :show, :id => @power_socket.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @power_socket.to_param
    assert_response :success
  end

  test "should update power_socket" do
    put :update, :id => @power_socket.to_param, :power_socket => @power_socket.attributes
    assert_redirected_to power_socket_path(assigns(:power_socket))
  end

  test "should destroy power_socket" do
    assert_difference('PowerSocket.count', -1) do
      delete :destroy, :id => @power_socket.to_param
    end

    assert_redirected_to power_sockets_path
  end
end
