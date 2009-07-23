Test Startup
============

Adds test-case wide startup and shutdown hooks to test/unit (or shoulda). Here's an example:
    
    require "test_startup"

    class MyTest < Test::Unit::TestCase
    
      startup do
        start_some_server
      end
      
      def test_should_access_server_properly
        # whatever
      end
      
      def test_should_do_other_servery_things
        # also, whatever
      end
      
      shutdown do
        stop_the_server
      end
      
    end

This avoids the overhead of starting the server for each and every test case.


Caveats
-------
You should probably think long and hard about whether or not you need this. In general, it's a good idea to have each test operate independently of each other, and this technique is only useful when it takes so long to setup the server (for example) that performing that for every test is not practical.
