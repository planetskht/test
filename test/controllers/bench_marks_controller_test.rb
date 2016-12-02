require 'test_helper'

class BenchMarksControllerTest < ActionController::TestCase
  setup do
    @bench_mark = bench_marks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bench_marks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bench_mark" do
    assert_difference('BenchMark.count') do
      post :create, bench_mark: { description: @bench_mark.description, project_id: @bench_mark.project_id, title: @bench_mark.title, type: @bench_mark.type }
    end

    assert_redirected_to bench_mark_path(assigns(:bench_mark))
  end

  test "should show bench_mark" do
    get :show, id: @bench_mark
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bench_mark
    assert_response :success
  end

  test "should update bench_mark" do
    patch :update, id: @bench_mark, bench_mark: { description: @bench_mark.description, project_id: @bench_mark.project_id, title: @bench_mark.title, type: @bench_mark.type }
    assert_redirected_to bench_mark_path(assigns(:bench_mark))
  end

  test "should destroy bench_mark" do
    assert_difference('BenchMark.count', -1) do
      delete :destroy, id: @bench_mark
    end

    assert_redirected_to bench_marks_path
  end
end
