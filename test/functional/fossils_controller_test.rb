require 'test_helper'

class FossilsControllerTest < ActionController::TestCase
  setup do
    @fossil = fossils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fossils)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fossil" do
    assert_difference('Fossil.count') do
      post :create, :fossil => @fossil.attributes
    end

    assert_redirected_to fossil_path(assigns(:fossil))
  end

  test "should show fossil" do
    get :show, :id => @fossil.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fossil.to_param
    assert_response :success
  end

  test "should update fossil" do
    put :update, :id => @fossil.to_param, :fossil => @fossil.attributes
    assert_redirected_to fossil_path(assigns(:fossil))
  end

  test "should destroy fossil" do
    assert_difference('Fossil.count', -1) do
      delete :destroy, :id => @fossil.to_param
    end

    assert_redirected_to fossils_path
  end
end
