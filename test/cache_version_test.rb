require File.dirname(__FILE__) + '/test_helper.rb'

class YaffleTest < Test::Unit::TestCase
  load_schema

  class Product < ActiveRecord::Base
  end

  class Person < ActiveRecord::Base
  end

  def test_schema_has_loaded_correctly
    assert_equal [], Product.all
    assert_equal [], Person.all
  end

	# TODO write tests

end
