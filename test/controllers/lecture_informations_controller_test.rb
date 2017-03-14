require 'test_helper'

class LectureInformationsControllerTest < ActionController::TestCase
  setup do
    @lecture_information = lecture_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lecture_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lecture_information" do
    assert_difference('LectureInformation.count') do
      post :create, lecture_information: {  }
    end

    assert_redirected_to lecture_information_path(assigns(:lecture_information))
  end

  test "should show lecture_information" do
    get :show, id: @lecture_information
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lecture_information
    assert_response :success
  end

  test "should update lecture_information" do
    patch :update, id: @lecture_information, lecture_information: {  }
    assert_redirected_to lecture_information_path(assigns(:lecture_information))
  end

  test "should destroy lecture_information" do
    assert_difference('LectureInformation.count', -1) do
      delete :destroy, id: @lecture_information
    end

    assert_redirected_to lecture_informations_path
  end
end
