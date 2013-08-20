require 'test_helper'

class ProjectLicensesControllerTest < ActionController::TestCase
  setup do
    @project_license = project_licenses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_licenses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_license" do
    assert_difference('ProjectLicense.count') do
      post :create, project_license: { license_text: @project_license.license_text, license_url: @project_license.license_url, name: @project_license.name }
    end

    assert_redirected_to project_license_path(assigns(:project_license))
  end

  test "should show project_license" do
    get :show, id: @project_license
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_license
    assert_response :success
  end

  test "should update project_license" do
    patch :update, id: @project_license, project_license: { license_text: @project_license.license_text, license_url: @project_license.license_url, name: @project_license.name }
    assert_redirected_to project_license_path(assigns(:project_license))
  end

  test "should destroy project_license" do
    assert_difference('ProjectLicense.count', -1) do
      delete :destroy, id: @project_license
    end

    assert_redirected_to project_licenses_path
  end
end
