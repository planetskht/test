require 'test_helper'

class SiteMapsControllerTest < ActionController::TestCase
  setup do
    @site_map = site_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_map" do
    assert_difference('SiteMap.count') do
      post :create, site_map: { description: @site_map.description, from_km: @site_map.from_km, title: @site_map.title, to_km: @site_map.to_km }
    end

    assert_redirected_to site_map_path(assigns(:site_map))
  end

  test "should show site_map" do
    get :show, id: @site_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @site_map
    assert_response :success
  end

  test "should update site_map" do
    patch :update, id: @site_map, site_map: { description: @site_map.description, from_km: @site_map.from_km, title: @site_map.title, to_km: @site_map.to_km }
    assert_redirected_to site_map_path(assigns(:site_map))
  end

  test "should destroy site_map" do
    assert_difference('SiteMap.count', -1) do
      delete :destroy, id: @site_map
    end

    assert_redirected_to site_maps_path
  end
end
