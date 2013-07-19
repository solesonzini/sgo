require File.dirname(__FILE__) + '/../test_helper'
require 'obrasociales_controller'

# Re-raise errors caught by the controller.
class ObrasocialesController; def rescue_action(e) raise e end; end

class ObrasocialesControllerTest < Test::Unit::TestCase
  fixtures :obrasociales

  def setup
    @controller = ObrasocialesController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = obrasociales(:first).id
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:obrasociales)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:obrasociale)
    assert assigns(:obrasociale).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:obrasociale)
  end

  def test_create
    num_obrasociales = Obrasociale.count

    post :create, :obrasociale => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_obrasociales + 1, Obrasociale.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:obrasociale)
    assert assigns(:obrasociale).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Obrasociale.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Obrasociale.find(@first_id)
    }
  end
end
