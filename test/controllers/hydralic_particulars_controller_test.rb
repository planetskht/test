require 'test_helper'

class HydralicParticularsControllerTest < ActionController::TestCase
  setup do
    @hydralic_particular = hydralic_particulars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hydralic_particulars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hydralic_particular" do
    assert_difference('HydralicParticular.count') do
      post :create, hydralic_particular: { description: @hydralic_particular.description, from_km: @hydralic_particular.from_km, project_id: @hydralic_particular.project_id, title: @hydralic_particular.title, to_km: @hydralic_particular.to_km, type: @hydralic_particular.type }
    end

    assert_redirected_to hydralic_particular_path(assigns(:hydralic_particular))
  end

  test "should show hydralic_particular" do
    get :show, id: @hydralic_particular
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @hydralic_particular
    assert_response :success
  end

  test "should update hydralic_particular" do
    patch :update, id: @hydralic_particular, hydralic_particular: { description: @hydralic_particular.description, from_km: @hydralic_particular.from_km, project_id: @hydralic_particular.project_id, title: @hydralic_particular.title, to_km: @hydralic_particular.to_km, type: @hydralic_particular.type }
    assert_redirected_to hydralic_particular_path(assigns(:hydralic_particular))
  end

  test "should destroy hydralic_particular" do
    assert_difference('HydralicParticular.count', -1) do
      delete :destroy, id: @hydralic_particular
    end

    assert_redirected_to hydralic_particulars_path
  end
end
