module Toys
  module StandardMiddleware
    ##
    # **_Defined in the toys-core gem_**
    #
    # A middleware that displays a version string for the root tool if the
    # `--version` flag is given.
    #
    class ShowRootVersion
      ##
      # Default version flags
      # @return [Array<String>]
      #
      DEFAULT_VERSION_FLAGS = ["--version"].freeze

      ##
      # Default description for the version flags
      # @return [String]
      #
      DEFAULT_VERSION_FLAG_DESC = "Display the version"

      ##
      # Key set when the version flag is present
      # @return [Object]
      #
      SHOW_VERSION_KEY = Object.new.freeze

      ##
      # Create a ShowVersion middleware
      #
      # @param version_string [String] The string that should be displayed.
      # @param version_flags [Array<String>] A list of flags that should
      #     trigger displaying the version. Default is
      #     {DEFAULT_VERSION_FLAGS}.
      # @param stream [IO] Output stream to write to. Default is stdout.
      #
      def initialize(version_string: nil,
                     version_flags: DEFAULT_VERSION_FLAGS,
                     version_flag_desc: DEFAULT_VERSION_FLAG_DESC,
                     stream: $stdout)
        # Source available in the toys-core gem
      end
    end
  end
end
