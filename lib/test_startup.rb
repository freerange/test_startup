require 'test/unit'

module TestStartupAndShutdown
  def startup(&block)
    install_global_startup
    @__startup_blocks ||= []
    @__startup_blocks << block if block_given?
    @__startup_blocks
  end
  
  def shutdown(&block)
    install_global_startup
    @__shutdown_blocks ||= []
    @__shutdown_blocks << block if block_given?
    @__shutdown_blocks
  end
  
  attr_reader :__startup_blocks, :__shutdown_blocks
  
  def install_global_startup
    extend(TestSuiteWithGlobalStartup)
  end
  
  module TestSuiteWithGlobalStartup
    def suite(*args)
      mysuite = super
      these_startup_blocks = __startup_blocks
      these_shutdown_blocks = __shutdown_blocks
      mysuite.instance_eval { @__startup_blocks = these_startup_blocks }
      mysuite.instance_eval { @__shutdown_blocks = these_shutdown_blocks }
      def mysuite.run(*args)
        @__startup_blocks.each { |block| block.call }
        super
        @__shutdown_blocks.each { |block| block.call }
      end
      mysuite
    end
  end
end

Test::Unit::TestCase.extend(TestStartupAndShutdown)