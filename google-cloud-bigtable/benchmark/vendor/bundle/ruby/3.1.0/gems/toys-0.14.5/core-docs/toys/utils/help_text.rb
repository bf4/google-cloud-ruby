module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # A helper class that generates usage documentation for a tool.
    #
    # This class generates full usage documentation, including description,
    # flags, and arguments. It is used by middleware that implements help
    # and related options.
    #
    # This class is not loaded by default. Before using it directly, you should
    # `require "toys/utils/help_text"`
    #
    class HelpText
      ##
      # Default width of first column
      # @return [Integer]
      #
      DEFAULT_LEFT_COLUMN_WIDTH = 32

      ##
      # Default indent
      # @return [Integer]
      #
      DEFAULT_INDENT = 4

      ##
      # Create a usage helper given an execution context.
      #
      # @param context [Toys::Context] The current context.
      # @return [Toys::Utils::HelpText]
      #
      def self.from_context(context)
        # Source available in the toys-core gem
      end

      ##
      # Create a usage helper.
      #
      # @param tool [Toys::ToolDefinition] The tool to document.
      # @param loader [Toys::Loader] A loader that can provide subcommands.
      # @param executable_name [String] The name of the executable.
      #     e.g. `"toys"`.
      # @param delegates [Array<Toys::ToolDefinition>] The delegation path to
      #     the tool.
      #
      # @return [Toys::Utils::HelpText]
      #
      def initialize(tool, loader, executable_name, delegates: [])
        # Source available in the toys-core gem
      end

      ##
      # The ToolDefinition being documented.
      # @return [Toys::ToolDefinition]
      #
      attr_reader :tool

      ##
      # Generate a short usage string.
      #
      # @param recursive [Boolean] If true, and the tool is a namespace,
      #     display all subtools recursively. Defaults to false.
      # @param include_hidden [Boolean] Include hidden subtools (i.e. whose
      #     names begin with underscore.) Default is false.
      # @param separate_sources [Boolean] Split up tool list by source root.
      #     Defaults to false.
      # @param left_column_width [Integer] Width of the first column. Default
      #     is {DEFAULT_LEFT_COLUMN_WIDTH}.
      # @param indent [Integer] Indent width. Default is {DEFAULT_INDENT}.
      # @param wrap_width [Integer,nil] Overall width to wrap to. Default is
      #     `nil` indicating no wrapping.
      #
      # @return [String] A usage string.
      #
      def usage_string(recursive: false, include_hidden: false, separate_sources: false,
                       left_column_width: nil, indent: nil, wrap_width: nil)
        # Source available in the toys-core gem
      end

      ##
      # Generate a long help string.
      #
      # @param recursive [Boolean] If true, and the tool is a namespace,
      #     display all subtools recursively. Defaults to false.
      # @param search [String,nil] An optional string to search for when
      #     listing subtools. Defaults to `nil` which finds all subtools.
      # @param include_hidden [Boolean] Include hidden subtools (i.e. whose
      #     names begin with underscore.) Default is false.
      # @param show_source_path [Boolean] If true, shows the source path
      #     section. Defaults to false.
      # @param separate_sources [Boolean] Split up tool list by source root.
      #     Defaults to false.
      # @param indent [Integer] Indent width. Default is {DEFAULT_INDENT}.
      # @param indent2 [Integer] Second indent width. Default is
      #     {DEFAULT_INDENT}.
      # @param wrap_width [Integer,nil] Wrap width of the column, or `nil` to
      #     disable wrap. Default is `nil`.
      # @param styled [Boolean] Output ansi styles. Default is `true`.
      #
      # @return [String] A usage string.
      #
      def help_string(recursive: false, search: nil, include_hidden: false,
                      show_source_path: false, separate_sources: false,
                      indent: nil, indent2: nil, wrap_width: nil, styled: true)
        # Source available in the toys-core gem
      end

      ##
      # Generate a subtool list string.
      #
      # @param recursive [Boolean] If true, and the tool is a namespace,
      #     display all subtools recursively. Defaults to false.
      # @param search [String,nil] An optional string to search for when
      #     listing subtools. Defaults to `nil` which finds all subtools.
      # @param include_hidden [Boolean] Include hidden subtools (i.e. whose
      #     names begin with underscore.) Default is false.
      # @param separate_sources [Boolean] Split up tool list by source root.
      #     Defaults to false.
      # @param indent [Integer] Indent width. Default is {DEFAULT_INDENT}.
      # @param wrap_width [Integer,nil] Wrap width of the column, or `nil` to
      #     disable wrap. Default is `nil`.
      # @param styled [Boolean] Output ansi styles. Default is `true`.
      #
      # @return [String] A usage string.
      #
      def list_string(recursive: false, search: nil, include_hidden: false,
                      separate_sources: false, indent: nil, wrap_width: nil, styled: true)
        # Source available in the toys-core gem
      end
    end
  end
end
