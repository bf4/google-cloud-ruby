module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A Toys-based CLI.
  #
  # This is the entry point for command line execution. It includes the set of
  # tool definitions (and/or information on how to load them from the file
  # system), configuration parameters such as logging and error handling, and a
  # method to call to invoke a command.
  #
  # This is the class to instantiate to create a Toys-based command line
  # executable. For example:
  #
  #     #!/usr/bin/env ruby
  #     require "toys-core"
  #     cli = Toys::CLI.new
  #     cli.add_config_block do
  #       def run
  #         puts "Hello, world!"
  #       end
  #     end
  #     exit(cli.run(*ARGV))
  #
  # The currently running CLI is also available at runtime, and can be used by
  # tools that want to invoke other tools. For example:
  #
  #     # My .toys.rb
  #     tool "foo" do
  #       def run
  #         puts "in foo"
  #       end
  #     end
  #     tool "bar" do
  #       def run
  #         puts "in bar"
  #         cli.run "foo"
  #       end
  #     end
  #
  class CLI
    ##
    # Create a CLI.
    #
    # Most configuration parameters (besides tool definitions and tool lookup
    # paths) are set as options passed to the constructor. These options fall
    # roughly into four categories:
    #
    #  *  Options affecting output behavior:
    #      *  `logger`: A global logger for all tools to use
    #      *  `logger_factory`: A proc that returns a logger to use
    #      *  `base_level`: The default log level
    #      *  `error_handler`: Callback for handling exceptions
    #      *  `executable_name`: The name of the executable
    #  *  Options affecting tool specification
    #      *  `extra_delimibers`: Tool name delimiters besides space
    #      *  `completion`: Tab completion handler
    #  *  Options affecting tool definition
    #      *  `middleware_stack`: The middleware applied to all tools
    #      *  `mixin_lookup`: Where to find well-known mixins
    #      *  `middleware_lookup`: Where to find well-known middleware
    #      *  `template_lookup`: Where to find well-known templates
    #  *  Options affecting tool files and directories
    #      *  `config_dir_name`: Directory name containing tool files
    #      *  `config_file_name`: File name for tools
    #      *  `index_file_name`: Name of index files in tool directories
    #      *  `preload_file_name`: Name of preload files in tool directories
    #      *  `preload_dir_name`: Name of preload directories in tool directories
    #      *  `data_dir_name`: Name of data directories in tool directories
    #
    # @param logger [Logger] A global logger to use for all tools. This may be
    #     set if the CLI will call at most one tool at a time. However, it will
    #     behave incorrectly if CLI might run multiple tools at the same time
    #     with different verbosity settings (since the logger cannot have
    #     multiple level settings simultaneously). In that case, do not set a
    #     global logger, but use the `logger_factory` parameter instead.
    # @param logger_factory [Proc] A proc that takes a {Toys::ToolDefinition}
    #     as an argument, and returns a `Logger` to use when running that tool.
    #     Optional. If not provided (and no global logger is set), CLI will use
    #     a default factory that writes generates loggers writing formatted
    #     output to `STDERR`, as defined by {Toys::CLI.default_logger_factory}.
    # @param base_level [Integer] The logger level that should correspond
    #     to zero verbosity.
    #     Optional. If not provided, defaults to the current level of the
    #     logger (which is often `Logger::WARN`).
    # @param error_handler [Proc,nil] A proc that is called when an error is
    #     caught. The proc should take a {Toys::ContextualError} argument and
    #     report the error. It should return an exit code (normally nonzero).
    #     Optional. If not provided, defaults to an instance of
    #     {Toys::CLI::DefaultErrorHandler}, which displays an error message to
    #     `STDERR`.
    # @param executable_name [String] The executable name displayed in help
    #     text. Optional. Defaults to the ruby program name.
    #
    # @param extra_delimiters [String] A string containing characters that can
    #     function as delimiters in a tool name. Defaults to empty. Allowed
    #     characters are period, colon, and slash.
    # @param completion [Toys::Completion::Base] A specifier for shell tab
    #     completion for the CLI as a whole.
    #     Optional. If not provided, defaults to an instance of
    #     {Toys::CLI::DefaultCompletion}, which delegates completion to the
    #     relevant tool.
    #
    # @param middleware_stack [Array<Toys::Middleware::Spec>] An array of
    #     middleware that will be used by default for all tools.
    #     Optional. If not provided, uses a default set of middleware defined
    #     in {Toys::CLI.default_middleware_stack}. To include no middleware,
    #     pass the empty array explicitly.
    # @param mixin_lookup [Toys::ModuleLookup] A lookup for well-known mixin
    #     modules (i.e. with symbol names).
    #     Optional. If not provided, defaults to the set of standard mixins
    #     provided by toys-core, as defined by
    #     {Toys::CLI.default_mixin_lookup}. If you explicitly want no standard
    #     mixins, pass an empty instance of {Toys::ModuleLookup}.
    # @param middleware_lookup [Toys::ModuleLookup] A lookup for well-known
    #     middleware classes.
    #     Optional. If not provided, defaults to the set of standard middleware
    #     classes provided by toys-core, as defined by
    #     {Toys::CLI.default_middleware_lookup}. If you explicitly want no
    #     standard middleware, pass an empty instance of
    #     {Toys::ModuleLookup}.
    # @param template_lookup [Toys::ModuleLookup] A lookup for well-known
    #     template classes.
    #     Optional. If not provided, defaults to the set of standard template
    #     classes provided by toys core, as defined by
    #     {Toys::CLI.default_template_lookup}. If you explicitly want no
    #     standard tenokates, pass an empty instance of {Toys::ModuleLookup}.
    #
    # @param config_dir_name [String] A directory with this name that appears
    #     in the loader path, is treated as a configuration directory whose
    #     contents are loaded into the toys configuration.
    #     Optional. If not provided, toplevel configuration directories are
    #     disabled.
    #     Note: the standard toys executable sets this to `".toys"`.
    # @param config_file_name [String] A file with this name that appears in
    #     the loader path, is treated as a toplevel configuration file whose
    #     contents are loaded into the toys configuration. This does not
    #     include "index" configuration files located within a configuration
    #     directory.
    #     Optional. If not provided, toplevel configuration files are disabled.
    #     Note: the standard toys executable sets this to `".toys.rb"`.
    # @param index_file_name [String] A file with this name that appears in any
    #     configuration directory is loaded first as a standalone configuration
    #     file. This does not include "toplevel" configuration files outside
    #     configuration directories.
    #     Optional. If not provided, index configuration files are disabled.
    #     Note: the standard toys executable sets this to `".toys.rb"`.
    # @param preload_file_name [String] A file with this name that appears
    #     in any configuration directory is preloaded using `require` before
    #     any tools in that configuration directory are defined. A preload file
    #     includes normal Ruby code, rather than Toys DSL definitions. The
    #     preload file is loaded before any files in a preload directory.
    #     Optional. If not provided, preload files are disabled.
    #     Note: the standard toys executable sets this to `".preload.rb"`.
    # @param preload_dir_name [String] A directory with this name that appears
    #     in any configuration directory is searched for Ruby files, which are
    #     preloaded using `require` before any tools in that configuration
    #     directory are defined. Files in a preload directory include normal
    #     Ruby code, rather than Toys DSL definitions. Files in a preload
    #     directory are loaded after any standalone preload file.
    #     Optional. If not provided, preload directories are disabled.
    #     Note: the standard toys executable sets this to `".preload"`.
    # @param data_dir_name [String] A directory with this name that appears in
    #     any configuration directory is added to the data directory search
    #     path for any tool file in that directory.
    #     Optional. If not provided, data directories are disabled.
    #     Note: the standard toys executable sets this to `".data"`.
    # @param lib_dir_name [String] A directory with this name that appears in
    #     any configuration directory is added to the Ruby load path when
    #     executing any tool file in that directory.
    #     Optional. If not provided, lib directories are disabled.
    #     Note: the standard toys executable sets this to `".lib"`.
    #
    def initialize(executable_name: nil, # rubocop:disable Metrics/MethodLength
                   middleware_stack: nil,
                   extra_delimiters: "",
                   config_dir_name: nil,
                   config_file_name: nil,
                   index_file_name: nil,
                   preload_file_name: nil,
                   preload_dir_name: nil,
                   data_dir_name: nil,
                   lib_dir_name: nil,
                   mixin_lookup: nil,
                   middleware_lookup: nil,
                   template_lookup: nil,
                   logger_factory: nil,
                   logger: nil,
                   base_level: nil,
                   error_handler: nil,
                   completion: nil)
      # Source available in the toys-core gem
    end

    ##
    # Make a clone with the same settings but no config blocks and no paths in
    # the loader. This is sometimes useful for calling another tool that has to
    # be loaded from a different configuration.
    #
    # @param opts [keywords] Any configuration arguments that should be
    #     modified from the original. See {#initialize} for a list of
    #     recognized keywords.
    # @return [Toys::CLI]
    # @yieldparam cli [Toys::CLI] If you pass a block, the new CLI is yielded
    #     to it so you can add paths and make other modifications.
    #
    def child(**opts)
      # Source available in the toys-core gem
    end

    ##
    # The current loader for this CLI.
    # @return [Toys::Loader]
    #
    attr_reader :loader

    ##
    # The effective executable name used for usage text in this CLI.
    # @return [String]
    #
    attr_reader :executable_name

    ##
    # The string of tool name delimiter characters (besides space).
    # @return [String]
    #
    attr_reader :extra_delimiters

    ##
    # The global logger, if any.
    # @return [Logger,nil]
    #
    attr_reader :logger

    ##
    # The logger factory.
    # @return [Proc]
    #
    attr_reader :logger_factory

    ##
    # The initial logger level in this CLI, used as the level for verbosity 0.
    # May be `nil`, indicating it will use the initial logger setting.
    # @return [Integer,nil]
    #
    attr_reader :base_level

    ##
    # The overall completion strategy for this CLI.
    # @return [Toys::Completion::Base,Proc]
    #
    attr_reader :completion

    ##
    # Add a specific configuration file or directory to the loader.
    #
    # This is generally used to load a static or "built-in" set of tools,
    # either for a standalone command line executable based on Toys, or to
    # provide a "default" set of tools for a dynamic executable. For example,
    # the main Toys executable uses this to load the builtin tools from its
    # "builtins" directory.
    #
    # @param path [String] A path to add. May reference a single Toys file or
    #     a Toys directory.
    # @param high_priority [Boolean] Add the config at the head of the priority
    #     list rather than the tail.
    # @param source_name [String] A custom name for the root source. Optional.
    # @param context_directory [String,nil,:path,:parent] The context directory
    #     for tools loaded from this path. You can pass a directory path as a
    #     string, `:path` to denote the given path, `:parent` to denote the
    #     given path's parent directory, or `nil` to denote no context.
    #     Defaults to `:parent`.
    # @return [self]
    #
    def add_config_path(path,
                        high_priority: false,
                        source_name: nil,
                        context_directory: :parent)
      # Source available in the toys-core gem
    end

    ##
    # Add a configuration block to the loader.
    #
    # This is used to create tools "inline", and is useful for simple command
    # line executables based on Toys.
    #
    # @param high_priority [Boolean] Add the config at the head of the priority
    #     list rather than the tail.
    # @param source_name [String] The source name that will be shown in
    #     documentation for tools defined in this block. If omitted, a default
    #     unique string will be generated.
    # @param block [Proc] The block of configuration, executed in the context
    #     of the tool DSL {Toys::DSL::Tool}.
    # @param context_directory [String,nil] The context directory for tools
    #     loaded from this block. You can pass a directory path as a string, or
    #     `nil` to denote no context. Defaults to `nil`.
    # @return [self]
    #
    def add_config_block(high_priority: false,
                         source_name: nil,
                         context_directory: nil,
                         &block)
      # Source available in the toys-core gem
    end

    ##
    # Checks the given directory path. If it contains a config file and/or
    # config directory, those are added to the loader.
    #
    # The main Toys executable uses this method to load tools from directories
    # in the `TOYS_PATH`.
    #
    # @param search_path [String] A path to search for configs.
    # @param high_priority [Boolean] Add the configs at the head of the
    #     priority list rather than the tail.
    # @param context_directory [String,nil,:path,:parent] The context directory
    #     for tools loaded from this path. You can pass a directory path as a
    #     string, `:path` to denote the given path, `:parent` to denote the
    #     given path's parent directory, or `nil` to denote no context.
    #     Defaults to `:path`.
    # @return [self]
    #
    def add_search_path(search_path,
                        high_priority: false,
                        context_directory: :path)
      # Source available in the toys-core gem
    end

    ##
    # Walk up the directory hierarchy from the given start location, and add to
    # the loader any config files and directories found.
    #
    # The main Toys executable uses this method to load tools from the current
    # directory and its ancestors.
    #
    # @param start [String] The first directory to add. Defaults to the current
    #     working directory.
    # @param terminate [Array<String>] Optional list of directories that should
    #     terminate the search. If the walk up the directory tree encounters
    #     one of these directories, the search is halted without checking the
    #     terminating directory.
    # @param high_priority [Boolean] Add the configs at the head of the
    #     priority list rather than the tail.
    # @return [self]
    #
    def add_search_path_hierarchy(start: nil, terminate: [], high_priority: false)
      # Source available in the toys-core gem
    end

    ##
    # Run the CLI with the given command line arguments.
    # Handles exceptions using the error handler.
    #
    # @param args [String...] Command line arguments specifying which tool to
    #     run and what arguments to pass to it. You may pass either a single
    #     array of strings, or a series of string arguments.
    # @param verbosity [Integer] Initial verbosity. Default is 0.
    # @param delegated_from [Toys::Context] The context from which this
    #     execution is delegated. Optional. Should be set only if this is a
    #     delegated execution.
    #
    # @return [Integer] The resulting process status code (i.e. 0 for success).
    #
    def run(*args, verbosity: 0, delegated_from: nil)
      # Source available in the toys-core gem
    end

    ##
    # Prepare a tool to be run, but just execute the given block rather than
    # performing a full run of the tool. This is intended for testing tools.
    # Unlike {#run}, this does not catch errors and perform error handling.
    #
    # @param args [String...] Command line arguments specifying which tool to
    #     run and what arguments to pass to it. You may pass either a single
    #     array of strings, or a series of string arguments.
    # @yieldparam context [Toys::Context] Yields the tool context.
    #
    # @return [Object] The value returned from the block.
    #
    def load_tool(*args)
      # Source available in the toys-core gem
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A basic error handler that prints out captured errors to a stream or
    # a logger.
    #
    class DefaultErrorHandler
      ##
      # Create an error handler.
      #
      # @param output [IO,nil] Where to write errors. Default is `$stderr`.
      #
      def initialize(output: $stderr)
        # Source available in the toys-core gem
      end

      ##
      # The error handler routine. Prints out the error message and backtrace,
      # and returns the correct result code.
      #
      # @param error [Exception] The error that occurred.
      # @return [Integer] The result code for the execution.
      #
      def call(error)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A Completion that implements the default algorithm for a CLI. This
    # algorithm simply determines the tool and uses its completion.
    #
    class DefaultCompletion < Completion::Base
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

    class << self
      ##
      # Returns a default set of middleware that may be used as a starting
      # point for a typical CLI. This set includes the following in order:
      #
      # *  {Toys::StandardMiddleware::SetDefaultDescriptions} providing
      #    defaults for description fields.
      # *  {Toys::StandardMiddleware::ShowHelp} adding the `--help` flag and
      #    providing default behavior for namespaces.
      # *  {Toys::StandardMiddleware::HandleUsageErrors}
      # *  {Toys::StandardMiddleware::AddVerbosityFlags} adding the `--verbose`
      #    and `--quiet` flags for managing the logger level.
      #
      # @return [Array<Toys::Middleware::Spec>]
      #
      def default_middleware_stack
        # Source available in the toys-core gem
      end

      ##
      # Returns a default ModuleLookup for mixins that points at the
      # StandardMixins module.
      #
      # @return [Toys::ModuleLookup]
      #
      def default_mixin_lookup
        # Source available in the toys-core gem
      end

      ##
      # Returns a default ModuleLookup for middleware that points at the
      # StandardMiddleware module.
      #
      # @return [Toys::ModuleLookup]
      #
      def default_middleware_lookup
        # Source available in the toys-core gem
      end

      ##
      # Returns a default empty ModuleLookup for templates.
      #
      # @return [Toys::ModuleLookup]
      #
      def default_template_lookup
        # Source available in the toys-core gem
      end

      ##
      # Returns a logger factory that generates loggers that write to stderr.
      # All loggers generated by this factory share a single
      # {Toys::Utils::Terminal}, so log entries may interleave but will not
      # interrupt one another.
      #
      # @return [Proc]
      #
      def default_logger_factory
        # Source available in the toys-core gem
      end
    end
  end
end
