require 'test_helper'

class PresetsControllerTest < ActionController::TestCase
  setup do
    @preset = presets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:presets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create preset" do
    assert_difference('Preset.count') do
      post :create, :preset => @preset.attributes
    end

    assert_redirected_to preset_path(assigns(:preset))
  end

  test "should show preset" do
    get :show, :id => @preset.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @preset.to_param
    assert_response :success
  end

  test "should update preset" do
    put :update, :id => @preset.to_param, :preset => @preset.attributes
    assert_redirected_to preset_path(assigns(:preset))
  end

  test "should destroy preset" do
    assert_difference('Preset.count', -1) do
      delete :destroy, :id => @preset.to_param
    end

    assert_redirected_to presets_path
  end
end
