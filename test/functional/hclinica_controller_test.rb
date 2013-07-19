require File.dirname(__FILE__) + '/../test_helper'
require 'hclinica_controller'

# Re-raise errors caught by the controller.
class HclinicaController; def rescue_action(e) raise e end; end

class HclinicaControllerTest < Test::Unit::TestCase
  def setup
    @controller = HclinicaController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
