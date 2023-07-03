module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # A helper class that activates and installs gems and sets up bundler.
    #
    # This class is not loaded by default. Before using it directly, you should
    # `require "toys/utils/gems"`
    #
    class Gems
      ##
      # **_Defined in the toys-core gem_**
      #
      # Failed to activate a gem.
      #
      class ActivationFailedError < ::StandardError
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Failed to install a gem.
      #
      class InstallFailedError < ActivationFailedError
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Need to add a gem to the bundle.
      #
      class GemfileUpdateNeededError < ActivationFailedError
        ##
        # Create a GemfileUpdateNeededError.
        #
        # @param requirements_text [String] Gems and versions missing.
        # @param gemfile_path [String] Path to the offending Gemfile.
        #
        def initialize(requirements_text, gemfile_path)
          # Source available in the toys-core gem
        end
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Failed to run Bundler
      #
      class BundlerFailedError < ::StandardError
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Could not find a Gemfile
      #
      class GemfileNotFoundError < BundlerFailedError
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # The bundle is not and could not be installed
      #
      class BundleNotInstalledError < BundlerFailedError
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Bundler has already been run; cannot do so again
      #
      class AlreadyBundledError < BundlerFailedError
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # The bundle contained a toys or toys-core dependency that is
      # incompatible with the currently running version.
      #
      class IncompatibleToysError < BundlerFailedError
      end

      ##
      # The gemfile names that are searched by default.
      # @return [Array<String>]
      #
      DEFAULT_GEMFILE_NAMES = [".gems.rb", "gems.rb", "Gemfile"].freeze

      ##
      # Activate the given gem. If it is not present, attempt to install it (or
      # inform the user to update the bundle).
      #
      # @param name [String] Name of the gem
      # @param requirements [String...] Version requirements
      # @return [void]
      #
      def self.activate(name, *requirements)
        # Source available in the toys-core gem
      end

      ##
      # Create a new gem activator.
      #
      # @param on_missing [:confirm,:error,:install] What to do if a needed gem
      #     is not installed. Possible values:
      #
      #      *  `:confirm` - prompt the user on whether to install
      #      *  `:error` - raise an exception
      #      *  `:install` - just install the gem
      #
      #     The default is `:confirm`.
      #
      # @param on_conflict [:error,:warn,:ignore] What to do if bundler has
      #     already been run with a different Gemfile. Possible values:
      #
      #      *  `:error` - raise an exception
      #      *  `:ignore` - just silently proceed without bundling again
      #      *  `:warn` - print a warning and proceed without bundling again
      #
      #     The default is `:error`.
      #
      # @param terminal [Toys::Utils::Terminal] Terminal to use (optional)
      # @param input [IO] Input IO (optional, defaults to STDIN)
      # @param output [IO] Output IO (optional, defaults to STDOUT)
      # @param suppress_confirm [Boolean] Deprecated. Use `on_missing` instead.
      # @param default_confirm [Boolean] Deprecated. Use `on_missing` instead.
      #
      def initialize(on_missing: nil,
                     on_conflict: nil,
                     terminal: nil,
                     input: nil,
                     output: nil,
                     suppress_confirm: nil,
                     default_confirm: nil)
        # Source available in the toys-core gem
      end

      ##
      # Activate the given gem. If it is not present, attempt to install it (or
      # inform the user to update the bundle).
      #
      # @param name [String] Name of the gem
      # @param requirements [String...] Version requirements
      # @return [void]
      #
      def activate(name, *requirements)
        # Source available in the toys-core gem
      end

      ##
      # Search for an appropriate Gemfile, and set up the bundle.
      #
      # @param groups [Array<String>] The groups to include in setup.
      #
      # @param gemfile_path [String] The path to the Gemfile to use. If `nil`
      #     or not given, the `:search_dirs` will be searched for a Gemfile.
      #
      # @param search_dirs [String,Array<String>] Directories in which to
      #     search for a Gemfile, if gemfile_path is not given. You can provide
      #     a single directory or an array of directories.
      #
      # @param gemfile_names [String,Array<String>] File names that are
      #     recognized as Gemfiles, when searching because gemfile_path is not
      #     given. Defaults to {DEFAULT_GEMFILE_NAMES}.
      #
      # @param retries [Integer] Number of times to retry bundler operations.
      #     Optional.
      #
      # @return [void]
      #
      def bundle(groups: nil,
                 gemfile_path: nil,
                 search_dirs: nil,
                 gemfile_names: nil,
                 retries: nil)
        # Source available in the toys-core gem
      end

      @global_mutex = ::Monitor.new
    end
  end
end
