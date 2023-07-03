module Toys
  module StandardMiddleware
    ##
    # **_Defined in the toys-core gem_**
    #
    # A middleware that provides flags for editing the verbosity.
    #
    # This middleware adds `-v`, `--verbose`, `-q`, and `--quiet` flags, if
    # not already defined by the tool. These flags affect the setting of
    # {Toys::Context::Key::VERBOSITY}, and, thus, the logger level.
    #
    class AddVerbosityFlags
      ##
      # Default verbose flags
      # @return [Array<String>]
      #
      DEFAULT_VERBOSE_FLAGS = ["-v", "--verbose"].freeze

      ##
      # Default quiet flags
      # @return [Array<String>]
      #
      DEFAULT_QUIET_FLAGS = ["-q", "--quiet"].freeze

      ##
      # Create a AddVerbosityFlags middleware.
      #
      # @param verbose_flags [Boolean,Array<String>,Proc] Specify flags
      #     to increase verbosity. The value may be any of the following:
      #
      #     *  An array of flags that increase verbosity.
      #     *  The `true` value to use {DEFAULT_VERBOSE_FLAGS}. (Default)
      #     *  The `false` value to disable verbose flags.
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param quiet_flags [Boolean,Array<String>,Proc] Specify flags
      #     to decrease verbosity. The value may be any of the following:
      #
      #     *  An array of flags that decrease verbosity.
      #     *  The `true` value to use {DEFAULT_QUIET_FLAGS}. (Default)
      #     *  The `false` value to disable quiet flags.
      #     *  A proc that takes a tool and returns any of the above.
      #
      def initialize(verbose_flags: true, quiet_flags: true)
        # Source available in the toys-core gem
      end
    end
  end
end
