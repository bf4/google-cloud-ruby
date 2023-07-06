module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # Representation of a formal set of flags that set a particular context
  # key. The flags within a single Flag definition are synonyms.
  #
  class Flag
    ##
    # **_Defined in the toys-core gem_**
    #
    # Representation of a single flag.
    #
    class Syntax
      # rubocop:disable Style/PerlBackrefs

      ##
      # Parse flag syntax
      # @param str [String] syntax.
      #
      def initialize(str)
        # Source available in the toys-core gem
      end

      # rubocop:enable Style/PerlBackrefs

      ##
      # The original string that was parsed to produce this syntax.
      # @return [String]
      #
      attr_reader :original_str

      ##
      # The flags (without values) corresponding to this syntax.
      # @return [Array<String>]
      #
      attr_reader :flags

      ##
      # The flag (without values) corresponding to the normal "positive" form
      # of this flag.
      # @return [String]
      #
      attr_reader :positive_flag

      ##
      # The flag (without values) corresponding to the "negative" form of this
      # flag, if any. i.e. if the original string was `"--[no-]abc"`, the
      # negative flag is `"--no-abc"`.
      # @return [String] The negative form.
      # @return [nil] if the flag has no negative form.
      #
      attr_reader :negative_flag

      ##
      # The original string with the value (if any) stripped, but retaining
      # the `[no-]` prefix if present.
      # @return [String]
      #
      attr_reader :str_without_value

      ##
      # A string used to sort this flag compared with others.
      # @return [String]
      #
      attr_reader :sort_str

      ##
      # The style of flag (`:long` or `:short`).
      # @return [:long] if this is a long flag (i.e. double hyphen)
      # @return [:short] if this is a short flag (i.e. single hyphen with one
      #     character).
      #
      attr_reader :flag_style

      ##
      # The type of flag (`:boolean` or `:value`)
      # @return [:boolean] if this is a boolean flag (i.e. no value)
      # @return [:value] if this flag takes a value (even if optional)
      # @return [nil] if this flag is indeterminate
      #
      attr_reader :flag_type

      ##
      # The type of value (`:required` or `:optional`)
      # @return [:required] if this flag takes a required value
      # @return [:optional] if this flag takes an optional value
      # @return [nil] if this flag is a boolean flag
      #
      attr_reader :value_type

      ##
      # The default delimiter used for the value of this flag. This could be
      # `""` or `" "` for a short flag, or `" "` or `"="` for a long flag.
      # @return [String] delimiter
      # @return [nil] if this flag is a boolean flag
      #
      attr_reader :value_delim

      ##
      # The default "label" for the value. e.g. in `--abc=VAL` the label is
      # `"VAL"`.
      # @return [String] the label
      # @return [nil] if this flag is a boolean flag
      #
      attr_reader :value_label

      ##
      # A canonical string representing this flag's syntax, normalized to match
      # the type, delimiters, etc. settings of other flag syntaxes. This is
      # generally used in help strings to represent this flag.
      # @return [String]
      #
      attr_reader :canonical_str

      ##
      # This method is accessible for testing only.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def configure_canonical(canonical_flag_type, canonical_value_type,
                              canonical_value_label, canonical_value_delim)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # The result of looking up a flag by name.
    #
    class Resolution
      ##
      # The flag string that was looked up
      # @return [String]
      #
      attr_reader :string

      ##
      # Whether an exact match of the string was found
      # @return [Boolean]
      #
      def found_exact?
        # Source available in the toys-core gem
      end

      ##
      # The number of matches that were found.
      # @return [Integer]
      #
      def count
        # Source available in the toys-core gem
      end

      ##
      # Whether a single unique match was found.
      # @return [Boolean]
      #
      def found_unique?
        # Source available in the toys-core gem
      end

      ##
      # Whether no matches were found.
      # @return [Boolean]
      #
      def not_found?
        # Source available in the toys-core gem
      end

      ##
      # Whether multiple matches were found (i.e. ambiguous input).
      # @return [Boolean]
      #
      def found_multiple?
        # Source available in the toys-core gem
      end

      ##
      # Return the unique {Toys::Flag}, or `nil` if not found or
      # not unique.
      # @return [Toys::Flag,nil]
      #
      def unique_flag
        # Source available in the toys-core gem
      end

      ##
      # Return the unique {Toys::Flag::Syntax}, or `nil` if not found
      # or not unique.
      # @return [Toys::Flag::Syntax,nil]
      #
      def unique_flag_syntax
        # Source available in the toys-core gem
      end

      ##
      # Return whether the unique match was a hit on the negative (`--no-*`)
      # case, or `nil` if not found or not unique.
      # @return [Boolean,nil]
      #
      def unique_flag_negative?
        # Source available in the toys-core gem
      end

      ##
      # Returns an array of the matching full flag strings.
      # @return [Array<String>]
      #
      def matching_flag_strings
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A Completion that returns all possible flags associated with a
    # {Toys::Flag}.
    #
    class DefaultCompletion < Completion::Base
      ##
      # Create a completion given configuration options.
      #
      # @param flag [Toys::Flag] The flag definition.
      # @param include_short [Boolean] Whether to include short flags.
      # @param include_long [Boolean] Whether to include long flags.
      # @param include_negative [Boolean] Whether to include `--no-*` forms.
      #
      def initialize(flag:, include_short: true, include_long: true, include_negative: true)
        # Source available in the toys-core gem
      end

      ##
      # Whether to include short flags
      # @return [Boolean]
      #
      def include_short?
        # Source available in the toys-core gem
      end

      ##
      # Whether to include long flags
      # @return [Boolean]
      #
      def include_long?
        # Source available in the toys-core gem
      end

      ##
      # Whether to include negative long flags
      # @return [Boolean]
      #
      def include_negative?
        # Source available in the toys-core gem
      end

      ##
      # Returns candidates for the current completion.
      #
      # @param context [Toys::Completion::Context] the current completion
      #     context including the string fragment.
      # @return [Array<Toys::Completion::Candidate>] an array of candidates
      #
      def call(context)
        # Source available in the toys-core gem
      end
    end

    ##
    # The set handler replaces the previous value.
    # @return [Proc]
    #
    SET_HANDLER = ->(val, _prev) { val }

    ##
    # The push handler pushes the given value using the `<<` operator.
    # @return [Proc]
    #
    PUSH_HANDLER = ->(val, prev) { prev.nil? ? [val] : prev << val }

    ##
    # The default handler is the set handler, replacing the previous value.
    # @return [Proc]
    #
    DEFAULT_HANDLER = SET_HANDLER

    ##
    # Create a flag definition.
    #
    # @param key [String,Symbol] The key to use to retrieve the value from
    #     the execution context.
    # @param flags [Array<String>] The flags in OptionParser format. If empty,
    #     a flag will be inferred from the key.
    # @param accept [Object] An acceptor that validates and/or converts the
    #     value. See {Toys::Acceptor.create} for recognized formats. Optional.
    #     If not specified, defaults to {Toys::Acceptor::DEFAULT}.
    # @param default [Object] The default value. This is the value that will
    #     be set in the context if this flag is not provided on the command
    #     line. Defaults to `nil`.
    # @param handler [Proc,nil,:set,:push] An optional handler for
    #     setting/updating the value. A handler is a proc taking two
    #     arguments, the given value and the previous value, returning the
    #     new value that should be set. You may also specify a predefined
    #     named handler. The `:set` handler (the default) replaces the
    #     previous value (effectively `-> (val, _prev) { val }`). The
    #     `:push` handler expects the previous value to be an array and
    #     pushes the given value onto it; it should be combined with setting
    #     `default: []` and is intended for "multi-valued" flags.
    # @param complete_flags [Object] A specifier for shell tab completion for
    #     flag names associated with this flag. By default, a
    #     {Toys::Flag::DefaultCompletion} is used, which provides the flag's
    #     names as completion candidates. To customize completion, set this to
    #     a hash of options to pass to the constructor for
    #     {Toys::Flag::DefaultCompletion}, or pass any other spec recognized
    #     by {Toys::Completion.create}.
    # @param complete_values [Object] A specifier for shell tab completion for
    #     flag values associated with this flag. Pass any spec recognized by
    #     {Toys::Completion.create}.
    # @param report_collisions [Boolean] Raise an exception if a flag is
    #     requested that is already in use or marked as disabled. Default is
    #     true.
    # @param group [Toys::FlagGroup] Group containing this flag.
    # @param desc [String,Array<String>,Toys::WrappableString] Short
    #     description for the flag. See {Toys::ToolDefinition#desc} for a
    #     description of allowed formats. Defaults to the empty string.
    # @param long_desc [Array<String,Array<String>,Toys::WrappableString>]
    #     Long description for the flag. See {Toys::ToolDefinition#long_desc}
    #     for a description of allowed formats. Defaults to the empty array.
    # @param display_name [String] A display name for this flag, used in help
    #     text and error messages.
    # @param used_flags [Array<String>] An array of flags already in use.
    #
    def self.create(key, flags = [],
                    used_flags: nil, report_collisions: true, accept: nil, handler: nil,
                    default: nil, complete_flags: nil, complete_values: nil, display_name: nil,
                    desc: nil, long_desc: nil, group: nil)
      # Source available in the toys-core gem
    end

    ##
    # Returns the flag group containing this flag
    # @return [Toys::FlagGroup]
    #
    attr_reader :group

    ##
    # Returns the key.
    # @return [Symbol]
    #
    attr_reader :key

    ##
    # Returns an array of Flag::Syntax for the flags.
    # @return [Array<Toys::Flag::Syntax>]
    #
    attr_reader :flag_syntax

    ##
    # Returns the effective acceptor.
    # @return [Toys::Acceptor::Base]
    #
    attr_reader :acceptor

    ##
    # Returns the default value, which may be `nil`.
    # @return [Object]
    #
    attr_reader :default

    ##
    # The short description string.
    #
    # When reading, this is always returned as a {Toys::WrappableString}.
    #
    # When setting, the description may be provided as any of the following:
    #  *  A {Toys::WrappableString}.
    #  *  A normal String, which will be transformed into a
    #     {Toys::WrappableString} using spaces as word delimiters.
    #  *  An Array of String, which will be transformed into a
    #     {Toys::WrappableString} where each array element represents an
    #     individual word for wrapping.
    #
    # @return [Toys::WrappableString]
    #
    attr_reader :desc

    ##
    # The long description strings.
    #
    # When reading, this is returned as an Array of {Toys::WrappableString}
    # representing the lines in the description.
    #
    # When setting, the description must be provided as an Array where *each
    # element* may be any of the following:
    #  *  A {Toys::WrappableString} representing one line.
    #  *  A normal String representing a line. This will be transformed into a
    #     {Toys::WrappableString} using spaces as word delimiters.
    #  *  An Array of String representing a line. This will be transformed into
    #     a {Toys::WrappableString} where each array element represents an
    #     individual word for wrapping.
    #
    # @return [Array<Toys::WrappableString>]
    #
    attr_reader :long_desc

    ##
    # The handler for setting/updating the value.
    # @return [Proc]
    #
    attr_reader :handler

    ##
    # The proc that determines shell completions for the flag.
    # @return [Proc,Toys::Completion::Base]
    #
    attr_reader :flag_completion

    ##
    # The proc that determines shell completions for the value.
    # @return [Proc,Toys::Completion::Base]
    #
    attr_reader :value_completion

    ##
    # The type of flag.
    #
    # @return [:boolean] if the flag is a simple boolean switch
    # @return [:value] if the flag sets a value
    #
    attr_reader :flag_type

    ##
    # The type of value.
    #
    # @return [:required] if the flag type is `:value` and the value is
    #     required.
    # @return [:optional] if the flag type is `:value` and the value is
    #     optional.
    # @return [nil] if the flag type is not `:value`.
    #
    attr_reader :value_type

    ##
    # The string label for the value as it should display in help.
    # @return [String] The label
    # @return [nil] if the flag type is not `:value`.
    #
    attr_reader :value_label

    ##
    # The value delimiter, which may be `""`, `" "`, or `"="`.
    #
    # @return [String] The delimiter
    # @return [nil] if the flag type is not `:value`.
    #
    attr_reader :value_delim

    ##
    # The display name of this flag.
    # @return [String]
    #
    attr_reader :display_name

    ##
    # A string that can be used to sort this flag
    # @return [String]
    #
    attr_reader :sort_str

    ##
    # An array of Flag::Syntax including only short (single dash) flags.
    # @return [Array<Flag::Syntax>]
    #
    def short_flag_syntax
      # Source available in the toys-core gem
    end

    ##
    # An array of Flag::Syntax including only long (double-dash) flags.
    # @return [Array<Flag::Syntax>]
    #
    def long_flag_syntax
      # Source available in the toys-core gem
    end

    ##
    # The list of all effective flags used.
    # @return [Array<String>]
    #
    def effective_flags
      # Source available in the toys-core gem
    end

    ##
    # Look up the flag by string. Returns an object that indicates whether
    # the given string matched this flag, whether the match was unique, and
    # other pertinent information.
    #
    # @param str [String] Flag string to look up
    # @return [Toys::Flag::Resolution] Information about the match.
    #
    def resolve(str)
      # Source available in the toys-core gem
    end

    ##
    # A list of canonical flag syntax strings.
    #
    # @return [Array<String>]
    #
    def canonical_syntax_strings
      # Source available in the toys-core gem
    end

    ##
    # Whether this flag is active--that is, it has a nonempty flags list.
    #
    # @return [Boolean]
    #
    def active?
      # Source available in the toys-core gem
    end

    ##
    # Set the short description string.
    #
    # See {#desc} for details.
    #
    # @param desc [Toys::WrappableString,String,Array<String>]
    #
    def desc=(desc)
      # Source available in the toys-core gem
    end

    ##
    # Set the long description strings.
    #
    # See {#long_desc} for details.
    #
    # @param long_desc [Array<Toys::WrappableString,String,Array<String>>]
    #
    def long_desc=(long_desc)
      # Source available in the toys-core gem
    end

    ##
    # Append long description strings.
    #
    # You must pass an array of lines in the long description. See {#long_desc}
    # for details on how each line may be represented.
    #
    # @param long_desc [Array<Toys::WrappableString,String,Array<String>>]
    # @return [self]
    #
    def append_long_desc(long_desc)
      # Source available in the toys-core gem
    end
  end
end
