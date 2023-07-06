module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # A class that provides tools for working with the XDG Base Directory
    # Specification.
    #
    # This class provides utility methods that locate base directories and
    # search paths for application state, configuration, caches, and other
    # data, according to the [XDG Base Directory Spec version
    # 0.8](https://specifications.freedesktop.org/basedir-spec/0.8/).
    #
    # Tools can use the `:xdg` mixin for convenient access to this class.
    #
    # ### Example
    #
    #     require "toys/utils/xdg"
    #
    #     xdg = Toys::Utils::XDG.new
    #
    #     # Get config file paths, in order from most to least inportant
    #     config_files = xdg.lookup_config("my-config.toml")
    #     config_files.each { |path| read_my_config(path) }
    #
    # ### Windows operation
    #
    # The Spec assumes a unix-like environment, and cannot be applied directly
    # to Windows without modification. In general, this class will function on
    # Windows, but with the following caveats:
    #
    #  *   All file paths must use Windows-style absolute paths, beginning with
    #      the drive letter.
    #  *   Environment variables that can contain multiple paths (`XDG_*_DIRS`)
    #      use the Windows path delimiter (`;`) rather than the unix path
    #      delimiter (`:`).
    #  *   Defaults for home directories (`XDG_*_HOME`) will follow unix
    #      conventions, using subdirectories under the user's profile directory
    #      rather than the Windows known folder paths.
    #  *   Defaults for search paths (`XDG_*_DIRS`) will be empty and will not
    #      use the Windows known folder paths.
    #
    class XDG
      ##
      # Create an instance of XDG.
      #
      # @param env [Hash{String=>String}] the environment variables. Normally,
      #     you can omit this argument, as it will default to `::ENV`.
      #
      def initialize(env: ::ENV)
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the current user's home directory.
      #
      # @return [String]
      #
      def home_dir
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the single base directory relative to
      # which user-specific data files should be written.
      # Corresponds to the value of the `$XDG_DATA_HOME` environment variable
      # and its defaults according to the XDG Base Directory Spec.
      #
      # @return [String]
      #
      def data_home
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the single base directory relative to
      # which user-specific configuration files should be written.
      # Corresponds to the value of the `$XDG_CONFIG_HOME` environment variable
      # and its defaults according to the XDG Base Directory Spec.
      #
      # @return [String]
      #
      def config_home
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the single base directory relative to
      # which user-specific state files should be written.
      # Corresponds to the value of the `$XDG_STATE_HOME` environment variable
      # and its defaults according to the XDG Base Directory Spec.
      #
      # @return [String]
      #
      def state_home
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the single base directory relative to
      # which user-specific non-essential (cached) data should be written.
      # Corresponds to the value of the `$XDG_CACHE_HOME` environment variable
      # and its defaults according to the XDG Base Directory Spec.
      #
      # @return [String]
      #
      def cache_home
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the single base directory relative to
      # which user-specific executable files may be written.
      # Returns the value of `$HOME/.local/bin` as specified by the XDG Base
      # Directory Spec.
      #
      # @return [String]
      #
      def executable_home
        # Source available in the toys-core gem
      end

      ##
      # Returns the set of preference ordered base directories relative to
      # which data files should be searched, as an array of absolute paths.
      # The array is ordered from most to least important, and does _not_
      # include the data home directory.
      # Corresponds to the value of the `$XDG_DATA_DIRS` environment variable
      # and its defaults according to the XDG Base Directory Spec.
      #
      # @return [Array<String>]
      #
      def data_dirs
        # Source available in the toys-core gem
      end

      ##
      # Returns the set of preference ordered base directories relative to
      # which configuration files should be searched, as an array of absolute
      # paths. The array is ordered from most to least important, and does
      # _not_ include the config home directory.
      # Corresponds to the value of the `$XDG_CONFIG_DIRS` environment variable
      # and its defaults according to the XDG Base Directory Spec.
      #
      # @return [Array<String>]
      #
      def config_dirs
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to the single base directory relative to
      # which user-specific runtime files and other file objects should be
      # placed. May return `nil` if no such directory could be determined.
      #
      # @return [String,nil]
      #
      def runtime_dir
        # Source available in the toys-core gem
      end

      ##
      # Searches the data directories for an object with the given relative
      # path, and returns an array of absolute paths to all objects found in
      # the data directories (i.e. in {#data_dirs} or {#data_home}), in order
      # from most to least important.
      #
      # @param path [String] Relative path of the object to search for
      # @param type [String,Symbol,Array<String,Symbol>] The type(s) of objects
      #     to find. You can specify any of the types defined by
      #     [File::Stat#ftype](https://ruby-doc.org/core/File/Stat.html#method-i-ftype),
      #     such as `file` or `directory`, or the special type `any`. Types can
      #     be specified as strings or the  corresponding symbols. If this
      #     argument is not provided, the default of `file` is used.
      # @return [Array<String>]
      #
      def lookup_data(path, type: :file)
        # Source available in the toys-core gem
      end

      ##
      # Searches the config directories for an object with the given relative
      # path, and returns an array of absolute paths to all objects found in
      # the config directories (i.e. in {#config_dirs} or {#config_home}), in
      # order from most to least important.
      #
      # @param path [String] Relative path of the object to search for
      # @param type [String,Symbol,Array<String,Symbol>] The type(s) of objects
      #     to find. You can specify any of the types defined by
      #     [File::Stat#ftype](https://ruby-doc.org/core/File/Stat.html#method-i-ftype),
      #     such as `file` or `directory`, or the special type `any`. Types can
      #     be specified as strings or the  corresponding symbols. If this
      #     argument is not provided, the default of `file` is used.
      # @return [Array<String>]
      #
      def lookup_config(path, type: :file)
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to a directory under {#data_home}, creating
      # it if it doesn't already exist.
      #
      # @param path [String] The relative path to the subdir within the base
      #     data directory.
      # @return [String] The absolute path to the subdir.
      # @raise [Errno::EEXIST] If a non-directory already exists there
      #
      def ensure_data_subdir(path)
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to a directory under {#config_home}, creating
      # it if it doesn't already exist.
      #
      # @param path [String] The relative path to the subdir within the base
      #     config directory.
      # @return [String] The absolute path to the subdir.
      # @raise [Errno::EEXIST] If a non-directory already exists there
      #
      def ensure_config_subdir(path)
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to a directory under {#state_home}, creating
      # it if it doesn't already exist.
      #
      # @param path [String] The relative path to the subdir within the base
      #     state directory.
      # @return [String] The absolute path to the subdir.
      # @raise [Errno::EEXIST] If a non-directory already exists there
      #
      def ensure_state_subdir(path)
        # Source available in the toys-core gem
      end

      ##
      # Returns the absolute path to a directory under {#cache_home}, creating
      # it if it doesn't already exist.
      #
      # @param path [String] The relative path to the subdir within the base
      #     cache directory.
      # @return [String] The absolute path to the subdir.
      # @raise [Errno::EEXIST] If a non-directory already exists there
      #
      def ensure_cache_subdir(path)
        # Source available in the toys-core gem
      end
    end
  end
end
