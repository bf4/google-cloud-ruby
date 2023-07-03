module Toys
  module StandardMiddleware
    ##
    # **_Defined in the toys-core gem_**
    #
    # This middleware sets default description fields for tools and command
    # line arguments and flags that do not have them set otherwise.
    #
    # You can modify the static descriptions for tools, namespaces, and the
    # root tool by passing parameters to this middleware. For finer control,
    # you can override methods to modify the description generation logic.
    #
    class SetDefaultDescriptions
      ##
      # The default description for tools.
      # @return [String]
      #
      DEFAULT_TOOL_DESC = "(No tool description available)"

      ##
      # The default description for delegating tools.
      # @return [String]
      #
      DEFAULT_DELEGATE_DESC = '(Delegates to "%<target>s")'

      ##
      # The default description for namespaces.
      # @return [String]
      #
      DEFAULT_NAMESPACE_DESC = "(A namespace of tools)"

      ##
      # The default description for the root tool.
      # @return [String]
      #
      DEFAULT_ROOT_DESC = "Command line tool built using the toys-core gem."

      ##
      # The default long description for the root tool.
      # @return [String]
      #
      DEFAULT_ROOT_LONG_DESC = [
        "This command line tool was built using the toys-core gem. See" \
          " https://dazuma.github.io/toys/gems/toys-core for more info.",
        "To replace this message, set the description and long description" \
          " of the root tool, or configure the SetDefaultDescriptions" \
          " middleware.",
      ].freeze

      ##
      # Create a SetDefaultDescriptions middleware given default descriptions.
      #
      # @param default_tool_desc [String,nil] The default short description for
      #     runnable tools, or `nil` not to set one. Defaults to
      #     {DEFAULT_TOOL_DESC}.
      # @param default_tool_long_desc [Array<String>,nil] The default long
      #     description for runnable tools, or `nil` not to set one. Defaults
      #     to `nil`.
      # @param default_namespace_desc [String,nil] The default short
      #     description for non-runnable tools, or `nil` not to set one.
      #     Defaults to {DEFAULT_TOOL_DESC}.
      # @param default_namespace_long_desc [Array<String>,nil] The default long
      #     description for non-runnable tools, or `nil` not to set one.
      #     Defaults to `nil`.
      # @param default_root_desc [String,nil] The default short description for
      #     the root tool, or `nil` not to set one. Defaults to
      #     {DEFAULT_ROOT_DESC}.
      # @param default_root_long_desc [Array<String>,nil] The default long
      #     description for the root tool, or `nil` not to set one. Defaults to
      #     {DEFAULT_ROOT_LONG_DESC}.
      # @param default_delegate_desc [String,nil] The default short description
      #     for delegate tools, or `nil` not to set one. May include an sprintf
      #     field for the `target` name. Defaults to {DEFAULT_DELEGATE_DESC}.
      #
      def initialize(default_tool_desc: DEFAULT_TOOL_DESC,
                     default_tool_long_desc: nil,
                     default_namespace_desc: DEFAULT_NAMESPACE_DESC,
                     default_namespace_long_desc: nil,
                     default_root_desc: DEFAULT_ROOT_DESC,
                     default_root_long_desc: DEFAULT_ROOT_LONG_DESC,
                     default_delegate_desc: DEFAULT_DELEGATE_DESC)
        # Source available in the toys-core gem
      end

      protected

      ##
      # This method implements the logic for generating a tool description.
      # By default, it uses the parameters given to the middleware object.
      # Override this method to provide different logic.
      #
      # @param tool [Toys::ToolDefinition] The tool to document.
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::Loader} is passed with key `:loader`. Future versions
      #     of Toys may provide additional information.
      # @return [String,Array<String>,Toys::WrappableString] The default
      #     description. See {Toys::DSL::Tool#desc} for info on the format.
      # @return [nil] if this middleware should not set the description.
      #
      def generate_tool_desc(tool, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements logic for generating a tool long description.
      # By default, it uses the parameters given to the middleware object.
      # Override this method to provide different logic.
      #
      # @param tool [Toys::ToolDefinition] The tool to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::Loader} is passed with key `:loader`. Future versions of
      #     Toys may provide additional information.
      # @return [Array<Toys::WrappableString,String,Array<String>>] The default
      #     long description. See {Toys::DSL::Tool#long_desc} for info on the
      #     format.
      # @return [nil] if this middleware should not set the long description.
      #
      def generate_tool_long_desc(tool, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements the logic for generating a flag description.
      # Override this method to provide different logic.
      #
      # @param flag [Toys::Flag] The flag to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::ToolDefinition} is passed with key `:tool`. Future
      #     versions of Toys may provide additional information.
      # @return [String,Array<String>,Toys::WrappableString] The default
      #     description. See {Toys::DSL::Tool#desc} for info on the format.
      # @return [nil] if this middleware should not set the description.
      #
      def generate_flag_desc(flag, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements logic for generating a flag long description.
      # Override this method to provide different logic.
      #
      # @param flag [Toys::Flag] The flag to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::ToolDefinition} is passed with key `:tool`. Future
      #     versions of Toys may provide additional information.
      # @return [Array<Toys::WrappableString,String,Array<String>>] The default
      #     long description. See {Toys::DSL::Tool#long_desc} for info on the
      #     format.
      # @return [nil] if this middleware should not set the long description.
      #
      def generate_flag_long_desc(flag, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements the logic for generating an arg description.
      # Override this method to provide different logic.
      #
      # @param arg [Toys::PositionalArg] The arg to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::ToolDefinition} is passed with key `:tool`. Future
      #     versions of Toys may provide additional information.
      # @return [String,Array<String>,Toys::WrappableString] The default
      #     description. See {Toys::DSL::Tool#desc} for info on the format.
      # @return [nil] if this middleware should not set the description.
      #
      def generate_arg_desc(arg, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements logic for generating an arg long description.
      # Override this method to provide different logic.
      #
      # @param arg [Toys::PositionalArg] The arg to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::ToolDefinition} is passed with key `:tool`. Future
      #     versions of Toys may provide additional information.
      # @return [Array<Toys::WrappableString,String,Array<String>>] The default
      #     long description. See {Toys::DSL::Tool#long_desc} for info on the
      #     format.
      # @return [nil] if this middleware should not set the long description.
      #
      def generate_arg_long_desc(arg, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements the logic for generating a flag group
      # description. Override this method to provide different logic.
      #
      # @param group [Toys::FlagGroup] The flag group to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::ToolDefinition} is passed with key `:tool`. Future
      #     versions of Toys may provide additional information.
      # @return [String,Array<String>,Toys::WrappableString] The default
      #     description. See {Toys::DSL::Tool#desc} for info on the format.
      # @return [nil] if this middleware should not set the description.
      #
      def generate_flag_group_desc(group, data)
        # Source available in the toys-core gem
      end

      ##
      # This method implements the logic for generating a flag group long
      # description. Override this method to provide different logic.
      #
      # @param group [Toys::FlagGroup] The flag group to document
      # @param data [Hash] Additional data that might be useful. Currently,
      #     the {Toys::ToolDefinition} is passed with key `:tool`. Future
      #     versions of Toys may provide additional information.
      # @return [Array<Toys::WrappableString,String,Array<String>>] The default
      #     long description. See {Toys::DSL::Tool#long_desc} for info on the
      #     format.
      # @return [nil] if this middleware should not set the long description.
      #
      def generate_flag_group_long_desc(group, data)
        # Source available in the toys-core gem
      end
    end
  end
end
