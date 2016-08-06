require('minitest/autorun')
require('minitest/rg')
require_relative('../models/nation')


class NationTest < MiniTest::Test

  def setup
    options={'nation'=>"Italy",'point' => '10'}
    @nation=Nation.new(options)
  
  end

  def test_nation_name
    assert_equal("Italy",@nation.nation)
  end

  def test_point
    assert_equal(10, @nation.point)
  end
end
