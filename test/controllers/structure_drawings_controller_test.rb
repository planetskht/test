require 'test_helper'

class StructureDrawingsControllerTest < ActionController::TestCase
  setup do
    @structure_drawing = structure_drawings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:structure_drawings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create structure_drawing" do
    assert_difference('StructureDrawing.count') do
      post :create, structure_drawing: { description: @structure_drawing.description, project_id: @structure_drawing.project_id, title: @structure_drawing.title, type: @structure_drawing.type }
    end

    assert_redirected_to structure_drawing_path(assigns(:structure_drawing))
  end

  test "should show structure_drawing" do
    get :show, id: @structure_drawing
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @structure_drawing
    assert_response :success
  end

  test "should update structure_drawing" do
    patch :update, id: @structure_drawing, structure_drawing: { description: @structure_drawing.description, project_id: @structure_drawing.project_id, title: @structure_drawing.title, type: @structure_drawing.type }
    assert_redirected_to structure_drawing_path(assigns(:structure_drawing))
  end

  test "should destroy structure_drawing" do
    assert_difference('StructureDrawing.count', -1) do
      delete :destroy, id: @structure_drawing
    end

    assert_redirected_to structure_drawings_path
  end
end
