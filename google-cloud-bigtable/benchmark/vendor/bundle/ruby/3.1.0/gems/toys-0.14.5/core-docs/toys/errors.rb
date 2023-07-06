module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # An exception indicating an error in a tool definition.
  #
  class ToolDefinitionError < ::StandardError
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # An exception indicating that a tool has no run method.
  #
  class NotRunnableError < ::StandardError
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # An exception indicating problems parsing arguments.
  #
  class ArgParsingError < ::StandardError
    ##
    # Create an ArgParsingError given a set of error messages
    # @param errors [Array<Toys::ArgParser::UsageError>]
    #
    def initialize(errors)
      # Source available in the toys-core gem
    end

    ##
    # The individual usage error messages.
    # @return [Array<Toys::ArgParser::UsageError>]
    #
    attr_reader :usage_errors
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # An exception indicating a problem during tool lookup
  #
  class LoaderError < ::StandardError
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # A wrapper exception used to provide user-oriented context for an error
  # thrown during tool execution.
  #
  class ContextualError < ::StandardError
    ##
    # Construct a ContextualError. This exception type is thrown from
    # {ContextualError.capture} and {ContextualError.capture_path} and should
    # not be constructed directly.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def initialize(cause, banner,
                   config_path: nil, config_line: nil,
                   tool_name: nil, tool_args: nil)
      # Source available in the toys-core gem
    end

    ##
    # The underlying exception
    # @return [::StandardError]
    #
    attr_reader :cause

    ##
    # An overall banner message
    # @return [String]
    #
    attr_reader :banner

    ##
    # The path to the toys config file in which the error was detected
    # @return [String]
    #
    attr_reader :config_path

    ##
    # The line number in the toys config file in which the error was detected
    # @return [Integer]
    #
    attr_reader :config_line

    ##
    # The full name of the tool that was running when the error occurred
    # @return [Array<String>]
    #
    attr_reader :tool_name

    ##
    # The arguments passed to the tool that was running when the error occurred
    # @return [Array<String>]
    #
    attr_reader :tool_args

    class << self
      ##
      # Execute the given block, and wrap any exceptions thrown with a
      # ContextualError. This is intended for loading a config file from the
      # given path, and wraps any Ruby parsing errors.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def capture_path(banner, path, **opts)
        # Source available in the toys-core gem
      end

      ##
      # Execute the given block, and wrap any exceptions thrown with a
      # ContextualError.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def capture(banner, **opts)
        # Source available in the toys-core gem
      end
    end
  end
end
