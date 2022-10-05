require "application_system_test_case"

class HesisTest < ApplicationSystemTestCase
  setup do
    @hesi = hesis(:one)
  end

  test "visiting the index" do
    visit hesis_url
    assert_selector "h1", text: "Hesis"
  end

  test "should create hesi" do
    visit hesis_url
    click_on "New hesi"

    fill_in "Date", with: @hesi.date
    fill_in "Time", with: @hesi.time
    click_on "Create Hesi"

    assert_text "Hesi was successfully created"
    click_on "Back"
  end

  test "should update Hesi" do
    visit hesi_url(@hesi)
    click_on "Edit this hesi", match: :first

    fill_in "Date", with: @hesi.date
    fill_in "Time", with: @hesi.time
    click_on "Update Hesi"

    assert_text "Hesi was successfully updated"
    click_on "Back"
  end

  test "should destroy Hesi" do
    visit hesi_url(@hesi)
    click_on "Destroy this hesi", match: :first

    assert_text "Hesi was successfully destroyed"
  end
end
