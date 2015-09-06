require 'test_helper'

class MoneyUagesControllerTest < ActionController::TestCase
  setup do
    @money_uage = money_uages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:money_uages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create money_uage" do
    assert_difference('MoneyUage.count') do
      post :create, money_uage: { income: @money_uage.income, money_in_shop: @money_uage.money_in_shop, outcome: @money_uage.outcome, remark: @money_uage.remark, transaction_date: @money_uage.transaction_date }
    end

    assert_redirected_to money_uage_path(assigns(:money_uage))
  end

  test "should show money_uage" do
    get :show, id: @money_uage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @money_uage
    assert_response :success
  end

  test "should update money_uage" do
    patch :update, id: @money_uage, money_uage: { income: @money_uage.income, money_in_shop: @money_uage.money_in_shop, outcome: @money_uage.outcome, remark: @money_uage.remark, transaction_date: @money_uage.transaction_date }
    assert_redirected_to money_uage_path(assigns(:money_uage))
  end

  test "should destroy money_uage" do
    assert_difference('MoneyUage.count', -1) do
      delete :destroy, id: @money_uage
    end

    assert_redirected_to money_uages_path
  end
end
