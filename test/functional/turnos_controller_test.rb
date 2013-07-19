require File.dirname(__FILE__) + '/../test_helper'
require 'turnos_controller'

# Re-raise errors caught by the controller.
class TurnosController; def rescue_action(e) raise e end; end

class TurnosControllerTest < Test::Unit::TestCase
  fixtures :turnos

  def setup
    @controller = TurnosController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = turnos(:first).id
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

    assert_not_nil assigns(:turnos)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:turno)
    assert assigns(:turno).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:turno)
  end

  def test_create
    num_turnos = Turno.count

    post :create, :turno => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_turnos + 1, Turno.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:turno)
    assert assigns(:turno).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Turno.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Turno.find(@first_id)
    }
  end
end
