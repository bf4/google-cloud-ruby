module Toys
  module StandardMiddleware
    ##
    # **_Defined in the toys-core gem_**
    #
    # A middleware that applies the given block to all tool configurations.
    #
    class ApplyConfig
      ##
      # Create an ApplyConfig middleware
      #
      # @param parent_source [Toys::SourceInfo] The SourceInfo corresponding to
      #     the source where this block is provided, or `nil` (the default) if
      #     the block does not come from a Toys file.
      # @param source_name [String] A user-visible name for the source, or
      #     `nil` to use the default.
      # @param block [Proc] The configuration to apply.
      #
      def initialize(parent_source: nil, source_name: nil, &block)
        # Source available in the toys-core gem
      end
    end
  end
end
