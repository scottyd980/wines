require 'test_helper'

class WineriesControllerTest < ActionController::TestCase
  setup do
    @winery = wineries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wineries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create winery" do
    assert_difference('Winery.count') do
      post :create, :winery => @winery.attributes
    end

    assert_redirected_to winery_path(assigns(:winery))
  end

  test "should show winery" do
    get :show, :id => @winery
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @winery
    assert_response :success
  end

  test "should update winery" do
    put :update, :id => @winery, :winery => @winery.attributes
    assert_redirected_to winery_path(assigns(:winery))
  end

  test "should destroy winery" do
    assert_difference('Winery.count', -1) do
      delete :destroy, :id => @winery
    end

    assert_redirected_to wineries_path
  end
end
