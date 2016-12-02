require 'test_helper'

class VillageMapsControllerTest < ActionController::TestCase
  setup do
    @village_map = village_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:village_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create village_map" do
    assert_difference('VillageMap.count') do
      post :create, village_map: { project_id: @village_map.project_id, title: @village_map.title, village_name: @village_map.village_name }
    end

    assert_redirected_to village_map_path(assigns(:village_map))
  end

  test "should show village_map" do
    get :show, id: @village_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @village_map
    assert_response :success
  end

  test "should update village_map" do
    patch :update, id: @village_map, village_map: { project_id: @village_map.project_id, title: @village_map.title, village_name: @village_map.village_name }
    assert_redirected_to village_map_path(assigns(:village_map))
  end

  test "should destroy village_map" do
    assert_difference('VillageMap.count', -1) do
      delete :destroy, id: @village_map
    end

    assert_redirected_to village_maps_path
  end
end
