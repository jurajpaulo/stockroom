require 'test_helper'

class StocksControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    Stock.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    Stock.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to stock_url(assigns(:stock))
  end
  
  def test_show
    get :show, :id => Stock.first
    assert_template 'show'
  end
  
  def test_edit
    get :edit, :id => Stock.first
    assert_template 'edit'
  end
  
  def test_update_invalid
    Stock.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Stock.first
    assert_template 'edit'
  end

  def test_update_valid
    Stock.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Stock.first
    assert_redirected_to stock_url(assigns(:stock))
  end
end
