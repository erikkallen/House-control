require 'test_helper'

class SocketStatesControllerTest < ActionController::TestCase
  setup do
    @socket_state = socket_states(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:socket_states)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create socket_state" do
    assert_difference('SocketState.count') do
      post :create, :socket_state => @socket_state.attributes
    end

    assert_redirected_to socket_state_path(assigns(:socket_state))
  end

  test "should show socket_state" do
    get :show, :id => @socket_state.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @socket_state.to_param
    assert_response :success
  end

  test "should update socket_state" do
    put :update, :id => @socket_state.to_param, :socket_state => @socket_state.attributes
    assert_redirected_to socket_state_path(assigns(:socket_state))
  end

  test "should destroy socket_state" do
    assert_difference('SocketState.count', -1) do
      delete :destroy, :id => @socket_state.to_param
    end

    assert_redirected_to socket_states_path
  end
end
