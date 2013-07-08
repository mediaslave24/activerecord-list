require 'helper'

class Element < ActiveRecord::Base
  include ActiveRecord::List
end

module ListTests
  def setup
    (10...14).each do |counter|
      Element.create! pos: counter
    end
  end

  def test_initial_position
    assert_equal [1,2,3,4], Element.find(:all, order: "pos").map(&:pos)
  end

  def test_change_position
    assert_equal [1,2,3,4], Element.find(:all, order: "pos").map(&:id)

    Element.find(2).move_up
    assert_equal [2,1,3,4], Element.find(:all, order: "pos").map(&:id)

    Element.find(2).move_down
    assert_equal [1,2,3,4], Element.find(:all, order: "pos").map(&:id)
  end
end

class TestList < Test::Unit::TestCase
  include ListTests
  def setup
    setup_db
    super
  end

  def teardown
    teardown_db
  end
end
