module Toys
  module StandardMixins
    ##
    # **_Defined in the toys-core gem_**
    #
    # Ensures that a bundle is installed and set up when this tool is run.
    #
    # The following parameters can be passed when including this mixin:
    #
    #  *  `:static` (Boolean) If `true`, installs the bundle immediately, when
    #     defining the tool. If `false` (the default), installs the bundle just
    #     before the tool runs.
    #
    #  *  `:groups` (Array\<String\>) The groups to include in setup.
    #
    #  *  `:gemfile_path` (String) The path to the Gemfile to use. If `nil` or
    #     not given, the `:search_dirs` will be searched for a Gemfile.
    #
    #  *  `:search_dirs` (String,Symbol,Array\<String,Symbol\>) Directories to
    #     search for a Gemfile.
    #
    #     You can pass full directory paths, and/or any of the following:
    #      *  `:context` - the current context directory.
    #      *  `:current` - the current working directory.
    #      *  `:toys` - the Toys directory containing the tool definition, and
    #         any of its parents within the Toys directory hierarchy.
    #
    #     The default is to search `[:toys, :context, :current]` in that order.
    #     See {DEFAULT_SEARCH_DIRS}.
    #
    #     For most directories, the bundler mixin will look for the files
    #     ".gems.rb", "gems.rb", and "Gemfile", in that order. In `:toys`
    #     directories, it will look only for ".gems.rb" and "Gemfile", in that
    #     order. These can be overridden by setting the `:gemfile_names` and/or
    #     `:toys_gemfile_names` arguments.
    #
    #  *  `:gemfile_names` (Array\<String\>) File names that are recognized as
    #     Gemfiles when searching in directories other than Toys directories.
    #     Defaults to {Toys::Utils::Gems::DEFAULT_GEMFILE_NAMES}.
    #
    #  *  `:toys_gemfile_names` (Array\<String\>) File names that are
    #     recognized as Gemfiles when wearching in Toys directories.
    #     Defaults to {DEFAULT_TOYS_GEMFILE_NAMES}.
    #
    #  *  `:on_missing` (Symbol) What to do if a needed gem is not installed.
    #
    #     Supported values:
    #      *  `:confirm` - prompt the user on whether to install (default).
    #      *  `:error` - raise an exception.
    #      *  `:install` - just install the gem.
    #
    #  *  `:on_conflict` (Symbol) What to do if bundler has already been run
    #     with a different Gemfile.
    #
    #     Supported values:
    #      *  `:error` - raise an exception (default).
    #      *  `:ignore` - just silently proceed without bundling again.
    #      *  `:warn` - print a warning and proceed without bundling again.
    #
    #  *  `:retries` (Integer) Number of times to retry bundler operations
    #     (optional)
    #
    #  *  `:terminal` (Toys::Utils::Terminal) Terminal to use (optional)
    #  *  `:input` (IO) Input IO (optional, defaults to STDIN)
    #  *  `:output` (IO) Output IO (optional, defaults to STDOUT)
    #
    module Bundler
      include Mixin

      ##
      # Default search directories for Gemfiles.
      # @return [Array<String,Symbol>]
      #
      DEFAULT_SEARCH_DIRS = [:toys, :context, :current].freeze

      ##
      # The gemfile names that are searched by default in Toys directories.
      # @return [Array<String>]
      #
      DEFAULT_TOYS_GEMFILE_NAMES = [".gems.rb", "Gemfile"].freeze
    end
  end
end
