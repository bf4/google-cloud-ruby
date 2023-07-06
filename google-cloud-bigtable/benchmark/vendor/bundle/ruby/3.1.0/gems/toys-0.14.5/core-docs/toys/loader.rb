module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # The Loader service loads tools from configuration files, and finds the
  # appropriate tool given a set of command line arguments.
  #
  class Loader
    ##
    # Create a Loader
    #
    # @param index_file_name [String,nil] A file with this name that appears
    #     in any configuration directory (not just a toplevel directory) is
    #     loaded first as a standalone configuration file. If not provided,
    #     standalone configuration files are disabled.
    # @param preload_file_name [String,nil] A file with this name that appears
    #     in any configuration directory is preloaded before any tools in that
    #     configuration directory are defined.
    # @param preload_dir_name [String,nil] A directory with this name that
    #     appears in any configuration directory is searched for Ruby files,
    #     which are preloaded before any tools in that configuration directory
    #     are defined.
    # @param data_dir_name [String,nil] A directory with this name that appears
    #     in any configuration directory is added to the data directory search
    #     path for any tool file in that directory.
    # @param lib_dir_name [String,nil] A directory with this name that appears
    #     in any configuration directory is added to the Ruby load path for any
    #     tool file in that directory.
    # @param middleware_stack [Array<Toys::Middleware::Spec>] An array of
    #     middleware that will be used by default for all tools loaded by this
    #     loader.
    # @param extra_delimiters [String] A string containing characters that can
    #     function as delimiters in a tool name. Defaults to empty. Allowed
    #     characters are period, colon, and slash.
    # @param mixin_lookup [Toys::ModuleLookup] A lookup for well-known
    #     mixin modules. Defaults to an empty lookup.
    # @param middleware_lookup [Toys::ModuleLookup] A lookup for
    #     well-known middleware classes. Defaults to an empty lookup.
    # @param template_lookup [Toys::ModuleLookup] A lookup for
    #     well-known template classes. Defaults to an empty lookup.
    #
    def initialize(index_file_name: nil,
                   preload_dir_name: nil,
                   preload_file_name: nil,
                   data_dir_name: nil,
                   lib_dir_name: nil,
                   middleware_stack: [],
                   extra_delimiters: "",
                   mixin_lookup: nil,
                   middleware_lookup: nil,
                   template_lookup: nil,
                   git_cache: nil)
      # Source available in the toys-core gem
    end

    ##
    # Add a configuration file/directory to the loader.
    #
    # @param path [String] A single path to add.
    # @param high_priority [Boolean] If true, add this path at the top of the
    #     priority list. Defaults to false, indicating the new path should be
    #     at the bottom of the priority list.
    # @param source_name [String] A custom name for the root source. Optional.
    # @param context_directory [String,nil,:path,:parent] The context directory
    #     for tools loaded from this path. You can pass a directory path as a
    #     string, `:path` to denote the given path, `:parent` to denote the
    #     given path's parent directory, or `nil` to denote no context.
    #     Defaults to `:parent`.
    # @return [self]
    #
    def add_path(path,
                 high_priority: false,
                 source_name: nil,
                 context_directory: :parent)
      # Source available in the toys-core gem
    end

    ##
    # Add a set of configuration files/directories from a common directory to
    # the loader. The set of paths will be added at the same priority level and
    # will share a root.
    #
    # @param root_path [String] A root path to be seen as the root source. This
    #     should generally be a directory containing the paths to add.
    # @param relative_paths [String,Array<String>] One or more paths to add, as
    #     relative paths from the common root.
    # @param high_priority [Boolean] If true, add the paths at the top of the
    #     priority list. Defaults to false, indicating the new paths should be
    #     at the bottom of the priority list.
    # @param context_directory [String,nil,:path,:parent] The context directory
    #     for tools loaded from this path. You can pass a directory path as a
    #     string, `:path` to denote the given root path, `:parent` to denote
    #     the given root path's parent directory, or `nil` to denote no context.
    #     Defaults to `:path`.
    # @return [self]
    #
    def add_path_set(root_path, relative_paths,
                     high_priority: false,
                     context_directory: :path)
      # Source available in the toys-core gem
    end

    ##
    # Add a configuration block to the loader.
    #
    # @param high_priority [Boolean] If true, add this block at the top of the
    #     priority list. Defaults to false, indicating the block should be at
    #     the bottom of the priority list.
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
    def add_block(high_priority: false,
                  source_name: nil,
                  context_directory: nil,
                  &block)
      # Source available in the toys-core gem
    end

    ##
    # Add a configuration git source to the loader.
    #
    # @param git_remote [String] The git repo URL
    # @param git_path [String] The path to the relevant file or directory in
    #     the repo. Specify the empty string to use the entire repo.
    # @param git_commit [String] The git ref (i.e. SHA, tag, or branch name)
    # @param high_priority [Boolean] If true, add this path at the top of the
    #     priority list. Defaults to false, indicating the new path should be
    #     at the bottom of the priority list.
    # @param update [Boolean] If the commit is not a SHA, pulls any updates
    #     from the remote. Defaults to false, which uses a local cache and does
    #     not update if the commit has been fetched previously.
    # @param context_directory [String,nil] The context directory for tools
    #     loaded from this source. You can pass a directory path as a string,
    #     or `nil` to denote no context. Defaults to `nil`.
    # @return [self]
    #
    def add_git(git_remote, git_path, git_commit,
                high_priority: false,
                update: false,
                context_directory: nil)
      # Source available in the toys-core gem
    end

    ##
    # Given a list of command line arguments, find the appropriate tool to
    # handle the command, loading it from the configuration if necessary.
    # This always returns a tool. If the specific tool path is not defined and
    # cannot be found in any configuration, it finds the nearest namespace that
    # *would* contain that tool, up to the root tool.
    #
    # Returns a tuple of the found tool, and the array of remaining arguments
    # that are not part of the tool name and should be passed as tool args.
    #
    # @param args [Array<String>] Command line arguments
    # @return [Array(Toys::ToolDefinition,Array<String>)]
    #
    def lookup(args)
      # Source available in the toys-core gem
    end

    ##
    # Given a tool name, looks up the specific tool, loading it from the
    # configuration if necessary.
    #
    # If there is an active tool, returns it; otherwise, returns the highest
    # priority tool that has been defined. If no tool has been defined with
    # the given name, returns `nil`.
    #
    # @param words [Array<String>] The tool name
    # @return [Toys::ToolDefinition] if the tool was found
    # @return [nil] if no such tool exists
    #
    def lookup_specific(words)
      # Source available in the toys-core gem
    end

    ##
    # Returns a list of subtools for the given path, loading from the
    # configuration if necessary. The list will be sorted by name.
    #
    # @param words [Array<String>] The name of the parent tool
    # @param recursive [Boolean] If true, return all subtools recursively
    #     rather than just the immediate children (the default)
    # @param include_hidden [Boolean] If true, include hidden subtools,
    #     i.e. names beginning with underscores. Defaults to false.
    # @param include_namespaces [Boolean] If true, include namespaces,
    #     i.e. tools that are not runnable but have descendents that would have
    #     been listed by the current filters. Defaults to false.
    # @param include_non_runnable [Boolean] If true, include tools that have
    #     no children and are not runnable. Defaults to false.
    # @return [Array<Toys::ToolDefinition>] An array of subtools.
    #
    def list_subtools(words,
                      recursive: false,
                      include_hidden: false,
                      include_namespaces: false,
                      include_non_runnable: false)
      # Source available in the toys-core gem
    end

    ##
    # Returns true if the given path has at least one subtool, even if they are
    # hidden or non-runnable. Loads from the configuration if necessary.
    #
    # @param words [Array<String>] The name of the parent tool
    # @return [Boolean]
    #
    def has_subtools?(words)
      # Source available in the toys-core gem
    end

    ##
    # Splits the given path using the delimiters configured in this Loader.
    # You may pass in either an array of strings, or a single string possibly
    # delimited by path separators. Always returns an array of strings.
    #
    # @param str [String,Symbol,Array<String,Symbol>] The path to split.
    # @return [Array<String>]
    #
    def split_path(str)
      # Source available in the toys-core gem
    end

    #### INTERNAL METHODS ####

    ##
    # Get or create the tool definition for the given name and priority.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def get_tool(words, priority, tool_class = nil)
      # Source available in the toys-core gem
    end

    ##
    # Returns the active tool specified by the given words, with the given
    # priority, without doing any loading. If the given priority matches the
    # currently active tool, returns it. If the given priority is lower than
    # the active priority, returns `nil`. If the given priority is higher than
    # the active priority, returns and activates a new tool.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def activate_tool(words, priority)
      # Source available in the toys-core gem
    end

    ##
    # Returns true if the given tool name currently exists in the loader.
    # Does not load the tool if not found.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def tool_defined?(words)
      # Source available in the toys-core gem
    end

    ##
    # Build a new tool.
    # Called only from ToolData.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def build_tool(words, priority, tool_class = nil)
      # Source available in the toys-core gem
    end

    ##
    # Stop search at the given priority. Returns true if successful.
    # Called only from the DSL.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def stop_loading_at_priority(priority)
      # Source available in the toys-core gem
    end

    ##
    # Loads the subtree under the given prefix.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def load_for_prefix(prefix)
      # Source available in the toys-core gem
    end

    ##
    # Attempt to get a well-known mixin module for the given symbolic name.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def resolve_standard_mixin(name)
      # Source available in the toys-core gem
    end

    ##
    # Attempt to get a well-known template class for the given symbolic name.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def resolve_standard_template(name)
      # Source available in the toys-core gem
    end

    ##
    # Load configuration from the given path. This is called from the `load`
    # directive in the DSL.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def load_path(parent_source, path, words, remaining_words, priority)
      # Source available in the toys-core gem
    end

    ##
    # Load configuration from the given git remote. This is called from the
    # `load_git` directive in the DSL.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def load_git(parent_source, git_remote, git_path, git_commit, words, remaining_words, priority,
                 update: false)
      # Source available in the toys-core gem
    end

    ##
    # Load a subtool block. Called from the `tool` directive in the DSL.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def load_block(parent_source, block, words, remaining_words, priority)
      # Source available in the toys-core gem
    end

    @git_cache_mutex = ::Monitor.new
    @default_git_cache = nil

    ##
    # Get a global default GitCache.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def self.default_git_cache
      # Source available in the toys-core gem
    end

    ##
    # Determine the next setting for remaining_words, given a word.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def self.next_remaining_words(remaining_words, word)
      # Source available in the toys-core gem
    end
  end
end
