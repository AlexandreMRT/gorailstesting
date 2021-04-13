require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    get projects_url
    assert_response :success
  end

  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { title: @project.title } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end
end
