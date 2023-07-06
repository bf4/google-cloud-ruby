module Toys
  module StandardMixins
    ##
    # **_Defined in the toys-core gem_**
    #
    # Provides methods for installing and activating third-party gems. When
    # this mixin is included, it provides a `gem` method that has the same
    # effect as {Toys::Utils::Gems#activate}, so you can ensure a gem is
    # present when running a tool. A `gem` directive is likewise added to the
    # tool DSL itself, so you can also ensure a gem is present when defining a
    # tool.
    #
    # You may make these methods available to your tool by including the
    # following directive in your tool configuration:
    #
    #     include :gems
    #
    # If you pass additional options to the include directive, those are used
    # to initialize settings for the gem install process. For example:
    #
    #     include :gems, on_missing: :error
    #
    # See {Toys::Utils::Gems#initialize} for a list of supported options.
    #
    module Gems
      include Mixin

      ##
      # A tool-wide instance of {Toys::Utils::Gems}.
      # @return [Toys::Utils::Gems]
      #
      def gems
        # Source available in the toys-core gem
      end

      ##
      # Activate the given gem.
      #
      # @param name [String] Name of the gem
      # @param requirements [String...] Version requirements
      # @return [void]
      #
      def gem(name, *requirements)
        # Source available in the toys-core gem
      end
    end
  end
end
