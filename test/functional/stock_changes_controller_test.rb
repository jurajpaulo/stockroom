require 'test_helper'

class StockChangesControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_template 'index'
  end
  
  def test_new
    get :new
    assert_template 'new'
  end
  
  def test_create_invalid
    StockChange.any_instance.stubs(:valid?).returns(false)
    post :create
    assert_template 'new'
  end

  def test_create_valid
    StockChange.any_instance.stubs(:valid?).returns(true)
    post :create
    assert_redirected_to stock_change_url(assigns(:stock_change))
  end
  
  def test_show
    get :show, :id => StockChange.first
    assert_template 'show'
  end
end
