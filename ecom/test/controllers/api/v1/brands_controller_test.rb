require "test_helper"

class Api::V1::BrandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_brands_index_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_brands_show_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_brands_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_brands_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_brands_destroy_url
    assert_response :success
  end
end
