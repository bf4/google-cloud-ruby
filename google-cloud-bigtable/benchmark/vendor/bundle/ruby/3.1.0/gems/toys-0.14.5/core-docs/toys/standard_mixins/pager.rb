module Toys
  module StandardMixins
    ##
    # **_Defined in the toys-core gem_**
    #
    # A mixin that provides a pager.
    #
    # This mixin provides an instance of {Toys::Utils::Pager}, which invokes
    # an external pager for output.
    #
    # You can also pass additional keyword arguments to the `include` directive
    # to configure the pager object. These will be passed on to
    # {Toys::Utils::Pager#initialize}.
    #
    # @example
    #
    #   include :pager
    #
    #   def run
    #     pager do |io|
    #       io.puts "A long string\n"
    #     end
    #   end
    #
    module Pager
      include Mixin

      ##
      # Context key for the Pager object.
      # @return [Object]
      #
      KEY = ::Object.new.freeze

      ##
      # Access the Pager.
      #
      # If *no* block is given, returns the pager object.
      #
      # If a block is given, the pager is executed with the given block, and
      # the exit code of the pager process is returned.
      #
      # @return [Toys::Utils::Pager] if no block is given.
      # @return [Integer] if a block is given.
      #
      def pager(&block)
        # Source available in the toys-core gem
      end
    end
  end
end
