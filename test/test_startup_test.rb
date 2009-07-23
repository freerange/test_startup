$:.push File.join(File.dirname(__FILE__), *%w[.. lib])

require 'test/unit'
require 'test/unit/ui/console/testrunner'
require 'test_startup'

class TestArtefact
  class << self
    attr_accessor :started, :stopped
  end
  
  self.started = 0
  self.stopped = 0
end

class TestStartupTest < Test::Unit::TestCase
  startup { TestArtefact.started += 1 }
  shutdown { TestArtefact.stopped += 1 }
  
  def test_should_call_startup_callback
    assert_equal 1, TestArtefact.started
  end
  
  def test_should_only_call_startup_callback_once
    assert_equal 1, TestArtefact.started
  end
  
  def test_should_not_call_stopped_while_tests_are_running
    assert_equal 0, TestArtefact.stopped
  end
end

class TestStartupExternalTest < Test::Unit::TestCase
  def test_should_call_shutdown_when_test_case_tests_have_finished
    assert_equal 1, TestArtefact.stopped
  end
end

class TestStartupSuite < Test::Unit::TestSuite
  # taking advantage of the fact that the tests run in the order they're added here.
  def self.suite
    result = self.new(self.class.name)
    result << TestStartupTest.suite
    result << TestStartupExternalTest.suite
    return result
  end
end

Test::Unit::UI::Console::TestRunner.run(TestStartupSuite)