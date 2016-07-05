require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get search" do
    xhr :get, :search, title: "Avengers"
    assert_response :success
  end

  test "exact title search term returns single results" do
    xhr :get, :search, title: "Avengers II"
    assert_equal(assigns(:articles).length, 1)
  end

  test "should post search" do
    xhr :post, :search, title: "Avengers"
    assert_response :success
  end

  test "single search term returns multiple results" do
    xhr :post, :search, title: "Avengers"
    assert_equal(assigns(:articles).length, 2)
  end
end
