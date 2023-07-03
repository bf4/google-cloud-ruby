module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A ToolDefinition describes a single command that can be invoked using Toys.
  # It has a name, a series of one or more words that you use to identify
  # the tool on the command line. It also has a set of formal flags and
  # command line arguments supported, and a block that gets run when the
  # tool is executed.
  #
  class ToolDefinition
    ##
    # **_Defined in the toys-core gem_**
    #
    # A Completion that implements the default algorithm for a tool.
    #
    class DefaultCompletion < Completion::Base
      ##
      # Create a completion given configuration options.
      #
      # @param complete_subtools [Boolean] Whether to complete subtool names
      # @param include_hidden_subtools [Boolean] Whether to include hidden
      #     subtools (i.e. those beginning with an underscore)
      # @param complete_args [Boolean] Whether to complete positional args
      # @param complete_flags [Boolean] Whether to complete flag names
      # @param complete_flag_values [Boolean] Whether to complete flag values
      # @param delegation_target [Array<String>,nil] Delegation target, or
      #     `nil` if none.
      #
      def initialize(complete_subtools: true, include_hidden_subtools: false,
                     complete_args: true, complete_flags: true, complete_flag_values: true,
                     delegation_target: nil)
        # Source available in the toys-core gem
      end

      ##
      # Whether to complete subtool names
      # @return [Boolean]
      #
      def complete_subtools?
        # Source available in the toys-core gem
      end

      ##
      # Whether to include hidden subtools
      # @return [Boolean]
      #
      def include_hidden_subtools?
        # Source available in the toys-core gem
      end

      ##
      # Whether to complete flags
      # @return [Boolean]
      #
      def complete_flags?
        # Source available in the toys-core gem
      end

      ##
      # Whether to complete positional args
      # @return [Boolean]
      #
      def complete_args?
        # Source available in the toys-core gem
      end

      ##
      # Whether to complete flag values
      # @return [Boolean]
      #
      def complete_flag_values?
        # Source available in the toys-core gem
      end

      ##
      # Delegation target, or nil for none.
      # @return [Array<String>] if there is a delegation target
      # @return [nil] if there is no delegation target
      #
      attr_accessor :delegation_target

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
    # **_Defined in the toys-core gem_**
    #
    # Tool-based settings class.
    #
    # The following settings are supported:
    #
    #  *  `propagate_helper_methods` (_Boolean_) - Whether subtools should
    #     inherit methods defined by parent tools. Defaults to `false`.
    #
    class Settings < ::Toys::Settings
      settings_attr :propagate_helper_methods, default: false
    end

    ##
    # Create a new tool.
    # Should be created only from the DSL via the Loader.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def initialize(parent, full_name, priority, source_root, middleware_stack, middleware_lookup,
                   tool_class = nil)
      # Source available in the toys-core gem
    end

    ##
    # Reset the definition of this tool, deleting all definition data but
    # leaving named acceptors, mixins, and templates intact.
    # Should be called only from the DSL.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def reset_definition
      # Source available in the toys-core gem
    end

    ##
    # Settings for this tool
    #
    # @return [Toys::Tool::Settings]
    #
    attr_reader :settings

    ##
    # The name of the tool as an array of strings.
    # This array may not be modified.
    #
    # @return [Array<String>]
    #
    attr_reader :full_name

    ##
    # The priority of this tool definition.
    #
    # @return [Integer]
    #
    attr_reader :priority

    ##
    # The root source info defining this tool, or nil if there is no source.
    #
    # @return [Toys::SourceInfo,nil]
    #
    attr_reader :source_root

    ##
    # The tool class.
    #
    # @return [Class]
    #
    attr_reader :tool_class

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
    # A list of all defined flag groups, in order.
    #
    # @return [Array<Toys::FlagGroup>]
    #
    attr_reader :flag_groups

    ##
    # A list of all defined flags.
    #
    # @return [Array<Toys::Flag>]
    #
    attr_reader :flags

    ##
    # A list of all defined required positional arguments.
    #
    # @return [Array<Toys::PositionalArg>]
    #
    attr_reader :required_args

    ##
    # A list of all defined optional positional arguments.
    #
    # @return [Array<Toys::PositionalArg>]
    #
    attr_reader :optional_args

    ##
    # The remaining arguments specification.
    #
    # @return [Toys::PositionalArg] The argument definition
    # @return [nil] if remaining arguments are not supported by this tool.
    #
    attr_reader :remaining_arg

    ##
    # A list of flags that have been used in the flag definitions.
    #
    # @return [Array<String>]
    #
    attr_reader :used_flags

    ##
    # The default context data set by arguments.
    #
    # @return [Hash]
    #
    attr_reader :default_data

    ##
    # The stack of middleware specs used for subtools.
    #
    # This array may be modified in place.
    #
    # @return [Array<Toys::Middleware::Spec>]
    #
    attr_reader :subtool_middleware_stack

    ##
    # The stack of built middleware specs for this tool.
    #
    # @return [Array<Toys::Middleware>]
    #
    attr_reader :built_middleware

    ##
    # Info on the source of this tool.
    #
    # @return [Toys::SourceInfo] The source info
    # @return [nil] if the source is not defined.
    #
    attr_reader :source_info

    ##
    # The custom context directory set for this tool.
    #
    # @return [String] The directory path
    # @return [nil] if no custom context directory is set.
    #
    attr_reader :custom_context_directory

    ##
    # The completion strategy for this tool.
    #
    # When reading, this may return an instance of one of the subclasses of
    # {Toys::Completion::Base}, or a Proc that duck-types it. Generally, this
    # defaults to a {Toys::ToolDefinition::DefaultCompletion}, providing a
    # standard algorithm that finds appropriate completions from flags,
    # positional arguments, and subtools.
    #
    # When setting, you may pass any of the following:
    #  *  `nil` or `:default` which sets the value to a default instance.
    #  *  A Hash of options to pass to the
    #     {Toys::ToolDefinition::DefaultCompletion} constructor.
    #  *  Any other form recognized by {Toys::Completion.create}.
    #
    # @return [Toys::Completion::Base,Proc]
    #
    attr_reader :completion

    ##
    # The interrupt handler.
    #
    # @return [Proc] The interrupt handler proc
    # @return [Symbol] The name of a method to call
    # @return [nil] if there is no interrupt handler
    #
    attr_reader :interrupt_handler

    ##
    # The usage error handler.
    #
    # @return [Proc] The usage error handler proc
    # @return [Symbol] The name of a method to call
    # @return [nil] if there is no usage error handler
    #
    attr_reader :usage_error_handler

    ##
    # The full name of the delegate target, if any.
    #
    # @return [Array<String>] if this tool delegates
    # @return [nil] if this tool does not delegate
    #
    attr_reader :delegate_target

    ##
    # The local name of this tool, i.e. the last element of the full name.
    #
    # @return [String]
    #
    def simple_name
      # Source available in the toys-core gem
    end

    ##
    # A displayable name of this tool, generally the full name delimited by
    # spaces.
    #
    # @return [String]
    #
    def display_name
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool is a root tool.
    # @return [Boolean]
    #
    def root?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool is marked as runnable.
    # @return [Boolean]
    #
    def runnable?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool handles interrupts.
    # @return [Boolean]
    #
    def handles_interrupts?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool handles usage errors.
    # @return [Boolean]
    #
    def handles_usage_errors?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool has at least one included module.
    # @return [Boolean]
    #
    def includes_modules?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if there is a specific description set for this tool.
    # @return [Boolean]
    #
    def includes_description?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if at least one flag or positional argument is defined
    # for this tool.
    # @return [Boolean]
    #
    def includes_arguments?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool has any definition information.
    # @return [Boolean]
    #
    def includes_definition?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool's definition has been finished and is locked.
    # @return [Boolean]
    #
    def definition_finished?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool has disabled argument parsing.
    # @return [Boolean]
    #
    def argument_parsing_disabled?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool enforces flags before args.
    # @return [Boolean]
    #
    def flags_before_args_enforced?
      # Source available in the toys-core gem
    end

    ##
    # Returns true if this tool requires exact flag matches.
    # @return [Boolean]
    #
    def exact_flag_match_required?
      # Source available in the toys-core gem
    end

    ##
    # All arg definitions in order: required, optional, remaining.
    #
    # @return [Array<Toys::PositionalArg>]
    #
    def positional_args
      # Source available in the toys-core gem
    end

    ##
    # Resolve the given flag given the flag string. Returns an object that
    # describes the resolution result, including whether the resolution
    # matched a unique flag, the specific flag syntax that was matched, and
    # additional information.
    #
    # @param str [String] Flag string
    # @return [Toys::Flag::Resolution]
    #
    def resolve_flag(str)
      # Source available in the toys-core gem
    end

    ##
    # Get the named acceptor from this tool or its ancestors.
    #
    # @param name [String] The acceptor name.
    # @return [Toys::Acceptor::Base] The acceptor.
    # @return [nil] if no acceptor of the given name is found.
    #
    def lookup_acceptor(name)
      # Source available in the toys-core gem
    end

    ##
    # Get the named template from this tool or its ancestors.
    #
    # @param name [String] The template name.
    # @return [Class,nil] The template class.
    # @return [nil] if no template of the given name is found.
    #
    def lookup_template(name)
      # Source available in the toys-core gem
    end

    ##
    # Get the named mixin from this tool or its ancestors.
    #
    # @param name [String] The mixin name.
    # @return [Module] The mixin module.
    # @return [nil] if no mixin of the given name is found.
    #
    def lookup_mixin(name)
      # Source available in the toys-core gem
    end

    ##
    # Get the named completion from this tool or its ancestors.
    #
    # @param name [String] The completion name
    # @return [Toys::Completion::Base,Proc] The completion proc.
    # @return [nil] if no completion of the given name is found.
    #
    def lookup_completion(name)
      # Source available in the toys-core gem
    end

    ##
    # Include the given mixin in the tool class.
    #
    # The mixin must be given as a module. You can use {#lookup_mixin} to
    # resolve named mixins.
    #
    # @param mod [Module] The mixin module
    # @return [self]
    #
    def include_mixin(mod, *args, **kwargs)
      # Source available in the toys-core gem
    end

    ##
    # Sets the path to the file that defines this tool.
    # A tool may be defined from at most one path. If a different path is
    # already set, it is left unchanged.
    #
    # @param source [Toys::SourceInfo] Source info
    # @return [self]
    #
    def lock_source(source)
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

    ##
    # Add a named acceptor to the tool. This acceptor may be refereneced by
    # name when adding a flag or an arg. See {Toys::Acceptor.create} for
    # detailed information on how to specify an acceptor.
    #
    # @param name [String] The name of the acceptor.
    # @param acceptor [Toys::Acceptor::Base,Object] The acceptor to add. You
    #     can provide either an acceptor object, or a spec understood by
    #     {Toys::Acceptor.create}.
    # @param type_desc [String] Type description string, shown in help.
    #     Defaults to the acceptor name.
    # @param block [Proc] Optional block used to create an acceptor. See
    #     {Toys::Acceptor.create}.
    # @return [self]
    #
    def add_acceptor(name, acceptor = nil, type_desc: nil, &block)
      # Source available in the toys-core gem
    end

    ##
    # Add a named mixin module to this tool.
    # You may provide a mixin module or a block that configures one.
    #
    # @param name [String] The name of the mixin.
    # @param mixin_module [Module] The mixin module.
    # @param block [Proc] Define the mixin module here if a `mixin_module` is
    #     not provided directly.
    # @return [self]
    #
    def add_mixin(name, mixin_module = nil, &block)
      # Source available in the toys-core gem
    end

    ##
    # Add a named completion proc to this tool. The completion may be
    # referenced by name when adding a flag or an arg. See
    # {Toys::Completion.create} for detailed information on how to specify a
    # completion.
    #
    # @param name [String] The name of the completion.
    # @param completion [Proc,Toys::Completion::Base,Object] The completion to
    #     add. You can provide either a completion object, or a spec understood
    #     by {Toys::Completion.create}.
    # @param options [Hash] Additional options to pass to the completion.
    # @param block [Proc] Optional block used to create a completion. See
    #     {Toys::Completion.create}.
    # @return [self]
    #
    def add_completion(name, completion = nil, **options, &block)
      # Source available in the toys-core gem
    end

    ##
    # Add a named template class to this tool.
    # You may provide a template class or a block that configures one.
    #
    # @param name [String] The name of the template.
    # @param template_class [Class] The template class.
    # @param block [Proc] Define the template class here if a `template_class`
    #     is not provided directly.
    # @return [self]
    #
    def add_template(name, template_class = nil, &block)
      # Source available in the toys-core gem
    end

    ##
    # Disable argument parsing for this tool.
    #
    # @return [self]
    #
    def disable_argument_parsing
      # Source available in the toys-core gem
    end

    ##
    # Enforce that flags must come before args for this tool.
    # You may disable enforcement by passoing `false` for the state.
    #
    # @param state [Boolean]
    # @return [self]
    #
    def enforce_flags_before_args(state = true)
      # Source available in the toys-core gem
    end

    ##
    # Require that flags must match exactly. (If false, flags can match an
    # unambiguous substring.)
    #
    # @param state [Boolean]
    # @return [self]
    #
    def require_exact_flag_match(state = true)
      # Source available in the toys-core gem
    end

    ##
    # Add a flag group to the group list.
    #
    # The type should be one of the following symbols:
    #  *  `:optional` All flags in the group are optional
    #  *  `:required` All flags in the group are required
    #  *  `:exactly_one` Exactly one flag in the group must be provided
    #  *  `:at_least_one` At least one flag in the group must be provided
    #  *  `:at_most_one` At most one flag in the group must be provided
    #
    # @param type [Symbol] The type of group. Default is `:optional`.
    # @param desc [String,Array<String>,Toys::WrappableString] Short
    #     description for the group. See {Toys::ToolDefinition#desc} for a
    #     description of allowed formats. Defaults to `"Flags"`.
    # @param long_desc [Array<String,Array<String>,Toys::WrappableString>]
    #     Long description for the flag group. See
    #     {Toys::ToolDefinition#long_desc} for a description of allowed
    #     formats. Defaults to the empty array.
    # @param name [String,Symbol,nil] The name of the group, or nil for no
    #     name.
    # @param report_collisions [Boolean] If `true`, raise an exception if a
    #     the given name is already taken. If `false`, ignore. Default is
    #     `true`.
    # @param prepend [Boolean] If `true`, prepend rather than append the
    #     group to the list. Default is `false`.
    # @return [self]
    #
    def add_flag_group(type: :optional, desc: nil, long_desc: nil,
                       name: nil, report_collisions: true, prepend: false)
      # Source available in the toys-core gem
    end

    ##
    # Add a flag to the current tool. Each flag must specify a key which
    # the script may use to obtain the flag value from the context.
    # You may then provide the flags themselves in `OptionParser` form.
    #
    # @param key [String,Symbol] The key to use to retrieve the value from
    #     the execution context.
    # @param flags [Array<String>] The flags in OptionParser format. If empty,
    #     a flag will be inferred from the key.
    # @param accept [Object] An acceptor that validates and/or converts the
    #     value. You may provide either the name of an acceptor you have
    #     defined, or one of the default acceptors provided by OptionParser.
    #     Optional. If not specified, accepts any value as a string.
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
    # @param complete_flags [Object] A specifier for shell tab completion
    #     for flag names associated with this flag. By default, a
    #     {Toys::Flag::DefaultCompletion} is used, which provides the flag's
    #     names as completion candidates. To customize completion, set this to
    #     a hash of options to pass to the constructor for
    #     {Toys::Flag::DefaultCompletion}, or pass any other spec recognized
    #     by {Toys::Completion.create}.
    # @param complete_values [Object] A specifier for shell tab completion
    #     for flag values associated with this flag. Pass any spec
    #     recognized by {Toys::Completion.create}.
    # @param report_collisions [Boolean] Raise an exception if a flag is
    #     requested that is already in use or marked as disabled. Default is
    #     true.
    # @param group [Toys::FlagGroup,String,Symbol,nil] Group for
    #     this flag. You may provide a group name, a FlagGroup object, or
    #     `nil` which denotes the default group.
    # @param desc [String,Array<String>,Toys::WrappableString] Short
    #     description for the flag. See {Toys::ToolDefinition#desc} for a
    #     description of allowed formats. Defaults to the empty string.
    # @param long_desc [Array<String,Array<String>,Toys::WrappableString>]
    #     Long description for the flag. See {Toys::ToolDefinition#long_desc}
    #     for a description of allowed formats. Defaults to the empty array.
    # @param display_name [String] A display name for this flag, used in help
    #     text and error messages.
    # @return [self]
    #
    def add_flag(key, flags = [],
                 accept: nil, default: nil, handler: nil, complete_flags: nil,
                 complete_values: nil, report_collisions: true, group: nil, desc: nil,
                 long_desc: nil, display_name: nil)
      # Source available in the toys-core gem
    end

    ##
    # Mark one or more flags as disabled, preventing their use by any
    # subsequent flag definition. This may be used to prevent middleware from
    # defining a particular flag.
    #
    # @param flags [String...] The flags to disable
    # @return [self]
    #
    def disable_flag(*flags)
      # Source available in the toys-core gem
    end

    ##
    # Add a required positional argument to the current tool. You must specify
    # a key which the script may use to obtain the argument value from the
    # context.
    #
    # @param key [String,Symbol] The key to use to retrieve the value from
    #     the execution context.
    # @param accept [Object] An acceptor that validates and/or converts the
    #     value. You may provide either the name of an acceptor you have
    #     defined, or one of the default acceptors provided by OptionParser.
    #     Optional. If not specified, accepts any value as a string.
    # @param complete [Object] A specifier for shell tab completion. See
    #     {Toys::Completion.create} for recognized formats.
    # @param display_name [String] A name to use for display (in help text and
    #     error reports). Defaults to the key in upper case.
    # @param desc [String,Array<String>,Toys::WrappableString] Short
    #     description for the arg. See {Toys::ToolDefinition#desc} for a
    #     description of allowed formats. Defaults to the empty string.
    # @param long_desc [Array<String,Array<String>,Toys::WrappableString>]
    #     Long description for the arg. See {Toys::ToolDefinition#long_desc}
    #     for a description of allowed formats. Defaults to the empty array.
    # @return [self]
    #
    def add_required_arg(key, accept: nil, complete: nil, display_name: nil,
                         desc: nil, long_desc: nil)
      # Source available in the toys-core gem
    end

    ##
    # Add an optional positional argument to the current tool. You must specify
    # a key which the script may use to obtain the argument value from the
    # context. If an optional argument is not given on the command line, the
    # value is set to the given default.
    #
    # @param key [String,Symbol] The key to use to retrieve the value from
    #     the execution context.
    # @param default [Object] The default value. This is the value that will
    #     be set in the context if this argument is not provided on the command
    #     line. Defaults to `nil`.
    # @param accept [Object] An acceptor that validates and/or converts the
    #     value. You may provide either the name of an acceptor you have
    #     defined, or one of the default acceptors provided by OptionParser.
    #     Optional. If not specified, accepts any value as a string.
    # @param complete [Object] A specifier for shell tab completion. See
    #     {Toys::Completion.create} for recognized formats.
    # @param display_name [String] A name to use for display (in help text and
    #     error reports). Defaults to the key in upper case.
    # @param desc [String,Array<String>,Toys::WrappableString] Short
    #     description for the arg. See {Toys::ToolDefinition#desc} for a
    #     description of allowed formats. Defaults to the empty string.
    # @param long_desc [Array<String,Array<String>,Toys::WrappableString>]
    #     Long description for the arg. See {Toys::ToolDefinition#long_desc}
    #     for a description of allowed formats. Defaults to the empty array.
    # @return [self]
    #
    def add_optional_arg(key, default: nil, accept: nil, complete: nil,
                         display_name: nil, desc: nil, long_desc: nil)
      # Source available in the toys-core gem
    end

    ##
    # Specify what should be done with unmatched positional arguments. You must
    # specify a key which the script may use to obtain the remaining args
    # from the context.
    #
    # @param key [String,Symbol] The key to use to retrieve the value from
    #     the execution context.
    # @param default [Object] The default value. This is the value that will
    #     be set in the context if no unmatched arguments are provided on the
    #     command line. Defaults to the empty array `[]`.
    # @param accept [Object] An acceptor that validates and/or converts the
    #     value. You may provide either the name of an acceptor you have
    #     defined, or one of the default acceptors provided by OptionParser.
    #     Optional. If not specified, accepts any value as a string.
    # @param complete [Object] A specifier for shell tab completion. See
    #     {Toys::Completion.create} for recognized formats.
    # @param display_name [String] A name to use for display (in help text and
    #     error reports). Defaults to the key in upper case.
    # @param desc [String,Array<String>,Toys::WrappableString] Short
    #     description for the arg. See {Toys::ToolDefinition#desc} for a
    #     description of allowed formats. Defaults to the empty string.
    # @param long_desc [Array<String,Array<String>,Toys::WrappableString>]
    #     Long description for the arg. See {Toys::ToolDefinition#long_desc}
    #     for a description of allowed formats. Defaults to the empty array.
    # @return [self]
    #
    def set_remaining_args(key, default: [], accept: nil, complete: nil,
                           display_name: nil, desc: nil, long_desc: nil)
      # Source available in the toys-core gem
    end

    ##
    # Set the run handler block
    #
    # @param proc [Proc] The runnable block
    #
    def run_handler=(proc)
      # Source available in the toys-core gem
    end

    ##
    # Set the interrupt handler.
    #
    # @param handler [Proc,Symbol] The interrupt handler
    #
    def interrupt_handler=(handler)
      # Source available in the toys-core gem
    end

    ##
    # Set the usage error handler.
    #
    # @param handler [Proc,Symbol] The usage error handler
    #
    def usage_error_handler=(handler)
      # Source available in the toys-core gem
    end

    ##
    # Add an initializer.
    #
    # @param proc [Proc] The initializer block
    # @param args [Object...] Arguments to pass to the initializer
    # @param kwargs [keywords] Keyword arguments to pass to the initializer
    # @return [self]
    #
    def add_initializer(proc, *args, **kwargs)
      # Source available in the toys-core gem
    end

    ##
    # Set the custom context directory.
    #
    # See {#custom_context_directory} for details.
    #
    # @param dir [String]
    #
    def custom_context_directory=(dir)
      # Source available in the toys-core gem
    end

    ##
    # Set the completion strategy for this ToolDefinition.
    #
    # See {#completion} for details.
    #
    # @param spec [Object]
    #
    def completion=(spec)
      # Source available in the toys-core gem
    end

    ##
    # Return the effective context directory.
    # If there is a custom context directory, uses that. Otherwise, looks for
    # a custom context directory up the tool ancestor chain. If none is
    # found, uses the default context directory from the source info. It is
    # possible for there to be no context directory at all, in which case,
    # returns nil.
    #
    # @return [String] The effective context directory path.
    # @return [nil] if there is no effective context directory.
    #
    def context_directory
      # Source available in the toys-core gem
    end

    ##
    # Causes this tool to delegate to another tool.
    #
    # @param target [Array<String>] The full path to the delegate tool.
    # @return [self]
    #
    def delegate_to(target)
      # Source available in the toys-core gem
    end

    ##
    # Lookup the custom context directory in this tool and its ancestors.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def lookup_custom_context_directory
      # Source available in the toys-core gem
    end

    ##
    # Mark this tool as having at least one module included.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def mark_includes_modules
      # Source available in the toys-core gem
    end

    ##
    # Complete definition and run middleware configs. Should be called from
    # the Loader only.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def finish_definition(loader)
      # Source available in the toys-core gem
    end

    ##
    # Run all initializers against a context. Called from the Runner.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def run_initializers(context)
      # Source available in the toys-core gem
    end

    ##
    # Check that the tool can still be defined. Should be called internally
    # or from the DSL only.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def check_definition_state(is_arg: false, is_method: false)
      # Source available in the toys-core gem
    end
  end
end
