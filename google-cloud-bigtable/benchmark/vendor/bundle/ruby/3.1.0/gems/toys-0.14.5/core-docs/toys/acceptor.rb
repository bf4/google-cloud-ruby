module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # An Acceptor validates and converts arguments. It is designed to be
  # compatible with the OptionParser accept mechanism.
  #
  # First, an acceptor validates the argument via its
  # {Toys::Acceptor::Base#match} method. This method should determine whether
  # the argument is valid, and return information that will help with
  # conversion of the argument.
  #
  # Second, an acceptor converts the argument to its final form via the
  # {Toys::Acceptor::Base#convert} method.
  #
  # Finally, an acceptor has a name that may appear in help text for flags and
  # arguments that use it.
  #
  module Acceptor
    ##
    # A sentinel that may be returned from a function-based acceptor to
    # indicate invalid input.
    # @return [Object]
    #
    REJECT = ::Object.new.freeze

    ##
    # The default type description.
    # @return [String]
    #
    DEFAULT_TYPE_DESC = "string"

    ##
    # **_Defined in the toys-core gem_**
    #
    # A base class for acceptors.
    #
    # The base acceptor does not do any validation (i.e. it accepts all
    # arguments) or conversion (i.e. it returns the original string). You can
    # subclass this base class and override the {#match} and {#convert} methods
    # to implement an acceptor.
    #
    class Base
      ##
      # Create a base acceptor.
      #
      # @param type_desc [String] Type description string, shown in help.
      #     Defaults to {Toys::Acceptor::DEFAULT_TYPE_DESC}.
      # @param well_known_spec [Object] The well-known acceptor spec associated
      #     with this acceptor, or `nil` for none.
      #
      def initialize(type_desc: nil, well_known_spec: nil)
        # Source available in the toys-core gem
      end

      ##
      # Type description string, shown in help.
      # @return [String]
      #
      attr_reader :type_desc

      ##
      # The well-known acceptor spec associated with this acceptor, if any.
      # This generally identifies an OptionParser-compatible acceptor spec. For
      # example, the acceptor object that corresponds to `Integer` will return
      # `Integer` from this attribute.
      #
      # @return [Object] the well-known acceptor
      # @return [nil] if there is no corresponding well-known acceptor
      #
      attr_reader :well_known_spec

      ##
      # Type description string, shown in help.
      # @return [String]
      #
      def to_s
        # Source available in the toys-core gem
      end

      ##
      # Validate the given input.
      #
      # When given a valid input, return an array in which the first element is
      # the original input string, and the remaining elements (which may be
      # empty) comprise any additional information that may be useful during
      # conversion. If there is no additional information, you can return the
      # original input string by itself without wrapping in an array.
      #
      # When given an invalid input, return a falsy value such as `nil`.
      #
      # Note that a `MatchData` object is a legitimate return value because it
      # duck-types the appropriate array.
      #
      # This default implementation simply returns the original input string,
      # as the only array element, indicating all inputs are valid. You can
      # override this method to provide a different validation function.
      #
      # @param str [String] The input argument string.
      # @return [String,Array,nil]
      #
      def match(str)
        # Source available in the toys-core gem
      end

      ##
      # Convert the given input.
      #
      # This method is passed the results of a successful match, including the
      # original input string and any other values returned from {#match}. It
      # must return the final converted value to use.
      #
      # @param str [String] Original argument string.
      # @param extra [Object...] Zero or more additional arguments comprising
      #     additional elements returned from the match function.
      # @return [Object] The converted argument as it should be stored in the
      #     context data.
      #
      def convert(str, *extra)
        # Source available in the toys-core gem
      end

      ##
      # Return suggestions for a given non-matching string.
      #
      # This method may be called when a match fails. It should return a
      # (possibly empty) array of suggestions that could be displayed to the
      # user as "did you mean..."
      #
      # The default implementation returns the empty list.
      #
      # @param str [String] A string that failed matching.
      # @return [Array<String>] A possibly empty array of alternative
      #     suggestions that could be displayed with "did you mean..."
      #
      def suggestions(str)
        # Source available in the toys-core gem
      end
    end

    ##
    # The default acceptor. Corresponds to the well-known acceptor for
    # `Object`.
    # @return [Toys::Acceptor::Base]
    #
    DEFAULT = Base.new(type_desc: "string", well_known_spec: ::Object)

    ##
    # **_Defined in the toys-core gem_**
    #
    # An acceptor that uses a simple function to validate and convert input.
    # The function must take the input string as its argument, and either
    # return the converted object to indicate success, or raise an exception or
    # return the sentinel {Toys::Acceptor::REJECT} to indicate invalid input.
    #
    class Simple < Base
      ##
      # Create a simple acceptor.
      #
      # You should provide an acceptor function, either as a proc in the
      # `function` argument, or as a block. The function must take as its one
      # argument the input string. If the string is valid, the function must
      # return the value to store in the tool's data. If the string is invalid,
      # the function may either raise an exception (which must descend from
      # `StandardError`) or return {Toys::Acceptor::REJECT}.
      #
      # @param function [Proc] The acceptor function
      # @param type_desc [String] Type description string, shown in help.
      #     Defaults to {Toys::Acceptor::DEFAULT_TYPE_DESC}.
      # @param well_known_spec [Object] The well-known acceptor spec associated
      #     with this acceptor, or `nil` for none.
      # @param block [Proc] The acceptor function, if not provided as a normal
      #     parameter.
      #
      def initialize(function = nil, type_desc: nil, well_known_spec: nil, &block)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # An acceptor that uses a regex to validate input. It also supports a
    # custom conversion function that generates the final value from the match
    # results.
    #
    class Pattern < Base
      ##
      # Create a pattern acceptor.
      #
      # You must provide a regular expression (or any object that duck-types
      # `Regexp#match`) as a validator.
      #
      # You may also optionally provide a converter, either as a proc or a
      # block. A converter must take as its arguments the values in the
      # `MatchData` returned from a successful regex match. That is, the first
      # argument is the original input string, and the remaining arguments are
      # the captures. The converter must return the final converted value.
      # If no converter is provided, no conversion is done and the input string
      # is returned.
      #
      # @param regex [Regexp] Regular expression defining value values.
      # @param converter [Proc] An optional converter function. May also be
      #     given as a block. Note that the converter will be passed all
      #     elements of the `MatchData`.
      # @param type_desc [String] Type description string, shown in help.
      #     Defaults to {Toys::Acceptor::DEFAULT_TYPE_DESC}.
      # @param well_known_spec [Object] The well-known acceptor spec associated
      #     with this acceptor, or `nil` for none.
      # @param block [Proc] A converter function, if not provided as a normal
      #     parameter.
      #
      def initialize(regex, converter = nil, type_desc: nil, well_known_spec: nil, &block)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # An acceptor that recognizes a fixed set of values.
    #
    # You provide a list of valid values. The input argument string will be
    # matched against the string forms of these valid values. If it matches,
    # the converter will return the actual value from the valid list.
    #
    # For example, you could pass `[:one, :two, 3]` as the set of values. If
    # an argument of `"two"` is passed in, the converter will yield a final
    # value of the symbol `:two`. If an argument of "3" is passed in, the
    # converter will yield the integer `3`. If an argument of "three" is
    # passed in, the match will fail.
    #
    class Enum < Base
      ##
      # Create an acceptor.
      #
      # @param values [Array<Object>] Valid values.
      # @param type_desc [String] Type description string, shown in help.
      #     Defaults to {Toys::Acceptor::DEFAULT_TYPE_DESC}.
      # @param well_known_spec [Object] The well-known acceptor spec associated
      #     with this acceptor, or `nil` for none.
      #
      def initialize(values, type_desc: nil, well_known_spec: nil)
        # Source available in the toys-core gem
      end

      ##
      # The array of enum values.
      # @return [Array<Object>]
      #
      attr_reader :values
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # An acceptor that recognizes a range of values.
    #
    # The input argument is matched against the given range. For example, you
    # can match against the integers from 1 to 10 by passing the range
    # `(1..10)`.
    #
    # You can also provide a conversion function that takes the input string
    # and converts it an object that can be compared by the range. If you do
    # not provide a converter, a default converter will be provided depending
    # on the types of objects serving as the range limits. Specifically:
    #
    #  *  If the range beginning and end are both `Integer`, then input strings
    #     are likewise converted to `Integer` when matched against the range.
    #     Accepted values are returned as integers.
    #  *  If the range beginning and end are both `Float`, then input strings
    #     are likewise converted to `Float`.
    #  *  If the range beginning and end are both `Rational`, then input
    #     strings are likewise converted to `Rational`.
    #  *  If the range beginning and end are both `Numeric` types but different
    #     subtypes (e.g. an `Integer` and a `Float`), then any type of numeric
    #     input (integer, float, rational) is accepted and matched against the
    #     range.
    #  *  If the range beginning and/or end are not numeric types, then no
    #     conversion is done by default.
    #
    class Range < Simple
      ##
      # Create an acceptor.
      #
      # @param range [Range] The range of acceptable values
      # @param converter [Proc] A converter proc that takes an input string and
      #     attempts to convert it to a type comparable by the range. For
      #     numeric ranges, this can be omitted because one is provided by
      #     default. You should provide a converter for other types of ranges.
      #     You can also pass the converter as a block.
      # @param type_desc [String] Type description string, shown in help.
      #     Defaults to {Toys::Acceptor::DEFAULT_TYPE_DESC}.
      # @param well_known_spec [Object] The well-known acceptor spec associated
      #     with this acceptor, or `nil` for none.
      # @param block [Proc] Converter function, if not provided as a normal
      #     parameter.
      #
      def initialize(range, converter = nil, type_desc: nil, well_known_spec: nil, &block)
        # Source available in the toys-core gem
      end

      ##
      # The range being checked.
      # @return [Range]
      #
      attr_reader :range
    end

    ##
    # A converter proc that handles integers. Useful in Simple and Range
    # acceptors.
    # @return [Proc]
    #
    INTEGER_CONVERTER = proc { |s| s.nil? ? nil : Integer(s) }

    ##
    # A converter proc that handles floats. Useful in Simple and Range
    # acceptors.
    # @return [Proc]
    #
    FLOAT_CONVERTER = proc { |s| s.nil? ? nil : Float(s) }

    ##
    # A converter proc that handles rationals. Useful in Simple and Range
    # acceptors.
    # @return [Proc]
    #
    RATIONAL_CONVERTER = proc { |s| s.nil? ? nil : Rational(s) }

    ##
    # A converter proc that handles any numeric value. Useful in Simple and
    # Range acceptors.
    # @return [Proc]
    #
    NUMERIC_CONVERTER =
      proc do |s|
        if s.include?("/")
          Rational(s)
        elsif s.include?(".") || (s.include?("e") && s !~ /\A-?0x/)
          Float(s)
        else
          Integer(s)
        end
      end

    ##
    # A set of strings that are considered true for boolean acceptors.
    # Currently set to `["+", "true", "yes"]`.
    # @return [Array<String>]
    #
    TRUE_STRINGS = ["+", "true", "yes"].freeze

    ##
    # A set of strings that are considered false for boolean acceptors.
    # Currently set to `["-", "false", "no", "nil"]`.
    # @return [Array<String>]
    #
    FALSE_STRINGS = ["-", "false", "no", "nil"].freeze

    ##
    # A converter proc that handles boolean strings. Recognizes {TRUE_STRINGS}
    # and {FALSE_STRINGS}. Useful for Simple acceptors.
    # @return [Proc]
    #
    BOOLEAN_CONVERTER =
      proc do |s|
        if s.empty?
          REJECT
        else
          s = s.downcase
          if TRUE_STRINGS.any? { |t| t.start_with?(s) }
            true
          elsif FALSE_STRINGS.any? { |f| f.start_with?(s) }
            false
          else
            REJECT
          end
        end
      end

    class << self
      ##
      # Lookup a standard acceptor name recognized by OptionParser.
      #
      # @param spec [Object] A well-known acceptor specification, such as
      #     `String`, `Integer`, `Array`, `OptionParser::DecimalInteger`, etc.
      # @return [Toys::Acceptor::Base] The corresponding Acceptor object
      # @return [nil] if the given standard acceptor was not recognized.
      #
      def lookup_well_known(spec)
        # Source available in the toys-core gem
      end

      ##
      # Create an acceptor from a variety of specification formats. The
      # acceptor is constructed from the given specification object and/or the
      # given block. Additionally, some acceptors can take an optional type
      # description string used to describe the type of data in online help.
      #
      # Recognized specs include:
      #
      #  *  Any well-known acceptor recognized by OptionParser, such as
      #     `Integer`, `Array`, or `OptionParser::DecimalInteger`. Any block
      #     and type description you provide are ignored.
      #
      #  *  Any **regular expression**. The returned acceptor validates only if
      #     the regex matches the *entire string parameter*.
      #
      #     You can also provide an optional conversion function as a block. If
      #     provided, the block must take a variable number of arguments, the
      #     first being the matched string and the remainder being the captures
      #     from the regular expression. It should return the converted object
      #     that will be stored in the context data. If you do not provide a
      #     block, no conversion takes place, and the original string is used.
      #
      #  *  An **array** of possible values. The acceptor validates if the
      #     string parameter matches the *string form* of one of the array
      #     elements (i.e. the results of calling `to_s` on the element.)
      #
      #     An array acceptor automatically converts the string parameter to
      #     the actual array element that it matched. For example, if the
      #     symbol `:foo` is in the array, it will match the string `"foo"`,
      #     and then store the symbol `:foo` in the tool data. You may not
      #     further customize the conversion function; any block is ignored.
      #
      #  *  A **range** of possible values. The acceptor validates if the
      #     string parameter, after conversion to the range type, lies within
      #     the range. The final value stored in context data is the converted
      #     value. For numeric ranges, conversion is provided, but if the range
      #     has a different type, you must provide the conversion function as
      #     a block.
      #
      #  *  A **function** as a Proc (where the block is ignored) or a block
      #     (if the spec is nil). This function performs *both* validation and
      #     conversion. It should take the string parameter as its argument,
      #     and it must either return the object that should be stored in the
      #     tool data, or raise an exception (descended from `StandardError`)
      #     to indicate that the string parameter is invalid. You may also
      #     return the sentinel value {Toys::Acceptor::REJECT} to indicate that
      #     the string is invalid.
      #
      #  *  The value `nil` or `:default` with no block, to indicate the
      #     default pass-through acceptor {Toys::Acceptor::DEFAULT}. Any type
      #     description you provide is ignored.
      #
      # Additional options:
      #
      #  *  `:type_desc` (String) The type description for interpolating into
      #     help text. Ignored if the spec indicates the default acceptor or a
      #     well-known acceptor.
      #
      # @param spec [Object] See the description for recognized values.
      # @param options [Hash] Additional options to pass to the acceptor.
      # @param block [Proc] See the description for recognized forms.
      # @return [Toys::Acceptor::Base,Proc]
      #
      def create(spec = nil, **options, &block)
        # Source available in the toys-core gem
      end

      ##
      # Take the various ways to express an acceptor spec, and convert them to
      # a canonical form expressed as a single object. This is called from the
      # DSL to generate a spec object that can be stored.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def scalarize_spec(spec, options, block)
        # Source available in the toys-core gem
      end
    end
  end
end
