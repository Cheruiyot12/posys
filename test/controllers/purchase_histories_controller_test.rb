require 'test_helper'

class PurchaseHistoriesControllerTest < ActionController::TestCase
  setup do
    @purchase_history = purchase_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:purchase_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create purchase_history" do
    assert_difference('PurchaseHistory.count') do
      post :create, purchase_history: { count: @purchase_history.count, payment: @purchase_history.payment, phone: @purchase_history.phone, purchase_item: @purchase_history.purchase_item, supplier_id: @purchase_history.supplier_id, voucher_no: @purchase_history.voucher_no }
    end

    assert_redirected_to purchase_history_path(assigns(:purchase_history))
  end

  test "should show purchase_history" do
    get :show, id: @purchase_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @purchase_history
    assert_response :success
  end

  test "should update purchase_history" do
    patch :update, id: @purchase_history, purchase_history: { count: @purchase_history.count, payment: @purchase_history.payment, phone: @purchase_history.phone, purchase_item: @purchase_history.purchase_item, supplier_id: @purchase_history.supplier_id, voucher_no: @purchase_history.voucher_no }
    assert_redirected_to purchase_history_path(assigns(:purchase_history))
  end

  test "should destroy purchase_history" do
    assert_difference('PurchaseHistory.count', -1) do
      delete :destroy, id: @purchase_history
    end

    assert_redirected_to purchase_histories_path
  end
end
