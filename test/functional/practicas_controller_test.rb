require File.dirname(__FILE__) + '/../test_helper'
require 'practicas_controller'

# Re-raise errors caught by the controller.
class PracticasController; def rescue_action(e) raise e end; end

class PracticasControllerTest < Test::Unit::TestCase
  fixtures :practicas

  def setup
    @controller = PracticasController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @first_id = practicas(:first).id
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

    assert_not_nil assigns(:practicas)
  end

  def test_show
    get :show, :id => @first_id

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:practica)
    assert assigns(:practica).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:practica)
  end

  def test_create
    num_practicas = Practica.count

    post :create, :practica => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_practicas + 1, Practica.count
  end

  def test_edit
    get :edit, :id => @first_id

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:practica)
    assert assigns(:practica).valid?
  end

  def test_update
    post :update, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => @first_id
  end

  def test_destroy
    assert_nothing_raised {
      Practica.find(@first_id)
    }

    post :destroy, :id => @first_id
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Practica.find(@first_id)
    }
  end
end
