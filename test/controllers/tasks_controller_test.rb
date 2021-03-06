require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    test_login!
    @task = tasks(:one)
  end

  test "should fail to get index as normal user" do
    get tasks_url
    assert_redirected_to new_admin_session_url
  end

  test "should succeed to get index as admin" do
    test_logout!
    test_admin_login!
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post tasks_url, params: { task: { completed: false, detail: 'lololol', card_id: @task.card_id } }
    end

    assert_redirected_to card_url(Task.last.card)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { completed: @task.completed, detail: @task.detail, card_id: @task.card_id } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    card = @task.card
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end

    assert_redirected_to card_url(card)
  end
end
