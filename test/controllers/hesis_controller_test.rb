require "test_helper"

class HesisControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hesi = hesis(:one)
  end

  test "should get index" do
    get hesis_url
    assert_response :success
  end

  test "should get new" do
    get new_hesi_url
    assert_response :success
  end

  test "should create hesi" do
    assert_difference("Hesi.count") do
      post hesis_url, params: { hesi: { date: @hesi.date, time: @hesi.time } }
    end

    assert_redirected_to hesi_url(Hesi.last)
  end

  test "should show hesi" do
    get hesi_url(@hesi)
    assert_response :success
  end

  test "should get edit" do
    get edit_hesi_url(@hesi)
    assert_response :success
  end

  test "should update hesi" do
    patch hesi_url(@hesi), params: { hesi: { date: @hesi.date, time: @hesi.time } }
    assert_redirected_to hesi_url(@hesi)
  end

  test "should destroy hesi" do
    assert_difference("Hesi.count", -1) do
      delete hesi_url(@hesi)
    end

    assert_redirected_to hesis_url
  end
end
