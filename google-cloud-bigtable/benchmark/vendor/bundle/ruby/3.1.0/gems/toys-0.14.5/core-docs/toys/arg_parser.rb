module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # An internal class that parses command line arguments for a tool.
  #
  # Generally, you should not need to use this class directly. It is called
  # from {Toys::CLI}.
  #
  class ArgParser
    ##
    # **_Defined in the toys-core gem_**
    #
    # Base representation of a usage error reported by the ArgParser.
    #
    # This functions similarly to an exception, but is not raised. Rather, it
    # is returned in the {Toys::ArgParser#errors} array.
    #
    class UsageError
      ##
      # Create a UsageError given a message and common data
      #
      # @param message [String] The basic error message.
      # @param name [String,nil] The name of the element (normally flag or
      #     positional argument) that reported the error, or nil if there is
      #     no definite element.
      # @param value [String,nil] The value that was rejected, or nil if not
      #     applicable.
      # @param suggestions [Array<String>,nil] An array of suggestions from
      #     DidYouMean, or nil if not applicable.
      #
      def initialize(message, name: nil, value: nil, suggestions: nil)
        # Source available in the toys-core gem
      end

      ##
      # The basic error message. Does not include suggestions, if any.
      #
      # @return [String]
      #
      attr_reader :message

      ##
      # The name of the element (normally a flag or positional argument) that
      # reported the error.
      #
      # @return [String] The element name.
      # @return [nil] if there is no definite element source.
      #
      attr_reader :name

      ##
      # The value that was rejected.
      #
      # @return [String] the value string
      # @return [nil] if a value is not applicable to this error.
      #
      attr_reader :value

      ##
      # An array of suggestions from DidYouMean.
      #
      # @return [Array<String>] array of suggestions.
      # @return [nil] if suggestions are not applicable to this error.
      #
      attr_reader :suggestions

      ##
      # A fully formatted error message including suggestions.
      #
      # @return [String]
      #
      def full_message
        # Source available in the toys-core gem
      end
      alias to_s full_message
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a value was provided for a flag that does not
    # take a value.
    #
    class FlagValueNotAllowedError < UsageError
      ##
      # Create a FlagValueNotAllowedError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param name [String] The name of the flag. Normally required.
      #
      def initialize(message = nil, name: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a value was not provided for a flag that requires
    # a value.
    #
    class FlagValueMissingError < UsageError
      ##
      # Create a FlagValueMissingError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param name [String] The name of the flag. Normally required.
      #
      def initialize(message = nil, name: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a flag name was not recognized.
    #
    class FlagUnrecognizedError < UsageError
      ##
      # Create a FlagUnrecognizedError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param value [String] The requested flag name. Normally required.
      # @param suggestions [Array<String>] An array of suggestions to present
      #     to the user. Optional.
      #
      def initialize(message = nil, value: nil, suggestions: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a flag name prefix was given that matched
    # multiple flags.
    #
    class FlagAmbiguousError < UsageError
      ##
      # Create a FlagAmbiguousError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param value [String] The requested flag name. Normally required.
      # @param suggestions [Array<String>] An array of suggestions to present
      #     to the user. Optional.
      #
      def initialize(message = nil, value: nil, suggestions: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a flag did not accept the value given it.
    #
    class FlagValueUnacceptableError < UsageError
      ##
      # Create a FlagValueUnacceptableError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param name [String] The name of the flag. Normally required.
      # @param value [String] The value given. Normally required.
      # @param suggestions [Array<String>] An array of suggestions to present
      #     to the user. Optional.
      #
      def initialize(message = nil, name: nil, value: nil, suggestions: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a positional argument did not accept the value
    # given it.
    #
    class ArgValueUnacceptableError < UsageError
      ##
      # Create an ArgValueUnacceptableError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param name [String] The name of the argument. Normally required.
      # @param value [String] The value given. Normally required.
      # @param suggestions [Array<String>] An array of suggestions to present
      #     to the user. Optional.
      #
      def initialize(message = nil, name: nil, value: nil, suggestions: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a required positional argument was not fulfilled.
    #
    class ArgMissingError < UsageError
      ##
      # Create an ArgMissingError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param name [String] The name of the argument. Normally required.
      #
      def initialize(message = nil, name: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating extra arguments were supplied.
    #
    class ExtraArgumentsError < UsageError
      ##
      # Create an ExtraArgumentsError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param value [String] The first extra argument. Normally required.
      # @param values [Array<String>] All extra arguments. Normally required.
      #
      def initialize(message = nil, value: nil, values: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating the given subtool name does not exist.
    #
    class ToolUnrecognizedError < UsageError
      ##
      # Create a ToolUnrecognizedError.
      #
      # @param message [String,nil] A custom message. Normally omitted, in
      #     which case an appropriate default is supplied.
      # @param value [String] The requested subtool. Normally required.
      # @param values [Array<String>] The full path of the requested tool.
      #     Normally required.
      # @param suggestions [Array<String>] An array of suggestions to present
      #     to the user. Optional.
      #
      def initialize(message = nil, value: nil, values: nil, suggestions: nil)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A UsageError indicating a flag group constraint was not fulfilled.
    #
    class FlagGroupConstraintError < UsageError
      ##
      # Create a FlagGroupConstraintError.
      #
      # @param message [String] The message. Required.
      #
      def initialize(message)
        # Source available in the toys-core gem
      end
    end

    ##
    # Create an argument parser for a particular tool.
    #
    # @param cli [Toys::CLI] The CLI in effect.
    # @param tool [Toys::ToolDefinition] The tool defining the argument format.
    # @param default_data [Hash] Additional initial data (such as verbosity).
    # @param require_exact_flag_match [Boolean] Whether to require flag matches
    #     be exact (not partial). Default is false.
    #
    def initialize(cli, tool, default_data: {}, require_exact_flag_match: false)
      # Source available in the toys-core gem
    end

    ##
    # The tool definition governing this parser.
    # @return [Toys::ToolDefinition]
    #
    attr_reader :tool

    ##
    # All command line arguments that have been parsed.
    # @return [Array<String>]
    #
    attr_reader :parsed_args

    ##
    # Extra positional args that were not matched.
    # @return [Array<String>]
    #
    attr_reader :unmatched_positional

    ##
    # Flags that were not matched.
    # @return [Array<String>]
    #
    attr_reader :unmatched_flags

    ##
    # All args that were not matched.
    # @return [Array<String>]
    #
    attr_reader :unmatched_args

    ##
    # The collected tool data from parsed arguments.
    # @return [Hash]
    #
    attr_reader :data

    ##
    # An array of parse error messages.
    # @return [Array<Toys::ArgParser::UsageError>]
    #
    attr_reader :errors

    ##
    # The current flag definition whose value is still pending
    #
    # @return [Toys::Flag] The pending flag definition
    # @return [nil] if there is no pending flag
    #
    attr_reader :active_flag_def

    ##
    # Whether flags are currently allowed. Returns false after `--` is received.
    # @return [Boolean]
    #
    def flags_allowed?
      # Source available in the toys-core gem
    end

    ##
    # Determine if this parser is finished
    # @return [Boolean]
    #
    def finished?
      # Source available in the toys-core gem
    end

    ##
    # The argument definition that will be applied to the next argument.
    #
    # @return [Toys::PositionalArg] The next argument definition.
    # @return [nil] if all arguments have been filled.
    #
    def next_arg_def
      # Source available in the toys-core gem
    end

    ##
    # Incrementally parse a single string or an array of strings
    #
    # @param args [String,Array<String>]
    # @return [self]
    #
    def parse(args)
      # Source available in the toys-core gem
    end

    ##
    # Complete parsing. This should be called after all arguments have been
    # processed. It does a final check for any errors, including:
    #
    #  *  The arguments ended with a flag that was expecting a value but wasn't
    #     provided.
    #  *  One or more required arguments were never given a value.
    #  *  One or more extra arguments were provided.
    #  *  Restrictions defined in one or more flag groups were not fulfilled.
    #
    # Any errors are added to the errors array. It also fills in final values
    # for `Context::Key::USAGE_ERRORS` and `Context::Key::ARGS`.
    #
    # After this method is called, this object is locked down, and no
    # additional arguments may be parsed.
    #
    # @return [self]
    #
    def finish
      # Source available in the toys-core gem
    end
  end
end
