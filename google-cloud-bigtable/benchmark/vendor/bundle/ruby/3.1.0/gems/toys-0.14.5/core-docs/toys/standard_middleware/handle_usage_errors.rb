module Toys
  module StandardMiddleware
    ##
    # **_Defined in the toys-core gem_**
    #
    # This middleware handles the case of a usage error. If a usage error, such
    # as an unrecognized flag or an unfulfilled required argument, is detected,
    # this middleware intercepts execution and displays the error along with
    # the short help string, and terminates execution with an error code.
    #
    class HandleUsageErrors
      ##
      # Exit code for usage error. (2 by convention)
      # @return [Integer]
      #
      USAGE_ERROR_EXIT_CODE = 2

      ##
      # Create a HandleUsageErrors middleware.
      #
      # @param exit_code [Integer] The exit code to return if a usage error
      #     occurs. Default is {USAGE_ERROR_EXIT_CODE}.
      # @param stream [IO] Output stream to write to. Default is stderr.
      # @param styled_output [Boolean,nil] Cause the tool to display help text
      #     with ansi styles. If `nil`, display styles if the output stream is
      #     a tty. Default is `nil`.
      #
      def initialize(exit_code: nil, stream: $stderr, styled_output: nil)
        # Source available in the toys-core gem
      end
    end
  end
end
