require 'test_helper'

class SubProjectsControllerTest < ActionController::TestCase
  setup do
    @sub_project = sub_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sub_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sub_project" do
    assert_difference('SubProject.count') do
      post :create, sub_project: { description: @sub_project.description, name: @sub_project.name, reference: @sub_project.reference }
    end

    assert_redirected_to sub_project_path(assigns(:sub_project))
  end

  test "should show sub_project" do
    get :show, id: @sub_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sub_project
    assert_response :success
  end

  test "should update sub_project" do
    patch :update, id: @sub_project, sub_project: { description: @sub_project.description, name: @sub_project.name, reference: @sub_project.reference }
    assert_redirected_to sub_project_path(assigns(:sub_project))
  end

  test "should destroy sub_project" do
    assert_difference('SubProject.count', -1) do
      delete :destroy, id: @sub_project
    end

    assert_redirected_to sub_projects_path
  end
end
