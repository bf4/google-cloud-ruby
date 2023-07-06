module Toys
  module StandardMiddleware
    ##
    # **_Defined in the toys-core gem_**
    #
    # A middleware that shows help text for the tool when a flag (typically
    # `--help`) is provided. It can also be configured to show help by
    # default if the tool is a namespace that is not runnable.
    #
    # If a tool is not runnable, this middleware can also add a
    # `--[no-]recursive` flag, which, when set to `true` (the default), shows
    # all subtools recursively rather than only immediate subtools. This
    # middleware can also search for keywords in its subtools.
    #
    class ShowHelp
      ##
      # Default help flags
      # @return [Array<String>]
      #
      DEFAULT_HELP_FLAGS = ["-?", "--help"].freeze

      ##
      # Default usage flags
      # @return [Array<String>]
      #
      DEFAULT_USAGE_FLAGS = ["--usage"].freeze

      ##
      # Default list subtools flags
      # @return [Array<String>]
      #
      DEFAULT_LIST_FLAGS = ["--tools"].freeze

      ##
      # Default recursive flags
      # @return [Array<String>]
      #
      DEFAULT_RECURSIVE_FLAGS = ["-r", "--[no-]recursive"].freeze

      ##
      # Default search flags
      # @return [Array<String>]
      #
      DEFAULT_SEARCH_FLAGS = ["-s WORD", "--search=WORD"].freeze

      ##
      # Default show-all-subtools flags
      # @return [Array<String>]
      #
      DEFAULT_SHOW_ALL_SUBTOOLS_FLAGS = ["--all"].freeze

      ##
      # Key set when the show help flag is present
      # @return [Object]
      #
      SHOW_HELP_KEY = Object.new.freeze

      ##
      # Key set when the show usage flag is present
      # @return [Object]
      #
      SHOW_USAGE_KEY = Object.new.freeze

      ##
      # Key set when the show subtool list flag is present
      # @return [Object]
      #
      SHOW_LIST_KEY = Object.new.freeze

      ##
      # Key for the recursive setting
      # @return [Object]
      #
      RECURSIVE_SUBTOOLS_KEY = Object.new.freeze

      ##
      # Key for the search string
      # @return [Object]
      #
      SEARCH_STRING_KEY = Object.new.freeze

      ##
      # Key for the show-all-subtools setting
      # @return [Object]
      #
      SHOW_ALL_SUBTOOLS_KEY = Object.new.freeze

      ##
      # Key for the tool name
      # @return [Object]
      #
      TOOL_NAME_KEY = Object.new.freeze

      ##
      # Create a ShowHelp middleware.
      #
      # @param help_flags [Boolean,Array<String>,Proc] Specify flags to
      #     display help. The value may be any of the following:
      #
      #     *  An array of flags.
      #     *  The `true` value to use {DEFAULT_HELP_FLAGS}.
      #     *  The `false` value for no flags. (Default)
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param usage_flags [Boolean,Array<String>,Proc] Specify flags to
      #     display usage. The value may be any of the following:
      #
      #     *  An array of flags.
      #     *  The `true` value to use {DEFAULT_USAGE_FLAGS}.
      #     *  The `false` value for no flags. (Default)
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param list_flags [Boolean,Array<String>,Proc] Specify flags to
      #     display subtool list. The value may be any of the following:
      #
      #     *  An array of flags.
      #     *  The `true` value to use {DEFAULT_LIST_FLAGS}.
      #     *  The `false` value for no flags. (Default)
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param recursive_flags [Boolean,Array<String>,Proc] Specify flags
      #     to control recursive subtool search. The value may be any of the
      #     following:
      #
      #     *  An array of flags.
      #     *  The `true` value to use {DEFAULT_RECURSIVE_FLAGS}.
      #     *  The `false` value for no flags. (Default)
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param search_flags [Boolean,Array<String>,Proc] Specify flags
      #     to search subtools for a search term. The value may be any of
      #     the following:
      #
      #     *  An array of flags.
      #     *  The `true` value to use {DEFAULT_SEARCH_FLAGS}.
      #     *  The `false` value for no flags. (Default)
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param show_all_subtools_flags [Boolean,Array<String>,Proc] Specify
      #     flags to show all subtools, including hidden tools and non-runnable
      #     namespaces. The value may be any of the following:
      #
      #     *  An array of flags.
      #     *  The `true` value to use {DEFAULT_SHOW_ALL_SUBTOOLS_FLAGS}.
      #     *  The `false` value for no flags. (Default)
      #     *  A proc that takes a tool and returns any of the above.
      #
      # @param default_recursive [Boolean] Whether to search recursively for
      #     subtools by default. Default is `false`.
      # @param default_show_all_subtools [Boolean] Whether to show all subtools
      #     by default. Default is `false`.
      # @param fallback_execution [Boolean] Cause the tool to display its own
      #     help text if it is not otherwise runnable. This is mostly useful
      #     for namespaces, which have children are not runnable. Default is
      #     `false`.
      # @param allow_root_args [Boolean] If the root tool includes flags for
      #     help or usage, and doesn't otherwise use positional arguments,
      #     then a tool name can be passed as arguments to display help for
      #     that tool.
      # @param show_source_path [Boolean] Show the source path section. Default
      #     is `false`.
      # @param separate_sources [Boolean] Split up tool list by source root.
      #     Defaults to false.
      # @param use_less [Boolean] If the `less` tool is available, and the
      #     output stream is a tty, then use `less` to display help text.
      # @param stream [IO] Output stream to write to. Default is stdout.
      # @param styled_output [Boolean,nil] Cause the tool to display help text
      #     with ansi styles. If `nil`, display styles if the output stream is
      #     a tty. Default is `nil`.
      #
      def initialize(help_flags: false,
                     usage_flags: false,
                     list_flags: false,
                     recursive_flags: false,
                     search_flags: false,
                     show_all_subtools_flags: false,
                     default_recursive: false,
                     default_show_all_subtools: false,
                     fallback_execution: false,
                     allow_root_args: false,
                     show_source_path: false,
                     separate_sources: false,
                     use_less: false,
                     stream: $stdout,
                     styled_output: nil)
        # Source available in the toys-core gem
      end
    end
  end
end
