require 'test_helper'

class TwesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @twe = twes(:one)
  end

  test "should get index" do
    get twes_url
    assert_response :success
  end

  test "should get new" do
    get new_twe_url
    assert_response :success
  end

  test "should create twe" do
    assert_difference('Twe.count') do
      post twes_url, params: { twe: { content: @twe.content, user_id: @twe.user_id } }
    end

    assert_redirected_to twe_url(Twe.last)
  end

  test "should show twe" do
    get twe_url(@twe)
    assert_response :success
  end

  test "should get edit" do
    get edit_twe_url(@twe)
    assert_response :success
  end

  test "should update twe" do
    patch twe_url(@twe), params: { twe: { content: @twe.content, user_id: @twe.user_id } }
    assert_redirected_to twe_url(@twe)
  end

  test "should destroy twe" do
    assert_difference('Twe.count', -1) do
      delete twe_url(@twe)
    end

    assert_redirected_to twes_url
  end
end
