module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A helper module that provides methods to do module lookups. This is
  # used to obtain named helpers, middleware, and templates from the
  # respective modules.
  #
  class ModuleLookup
    class << self
      ##
      # Convert the given string to a path element. Specifically, converts
      # to `lower_snake_case`.
      #
      # @param str [String,Symbol] String to convert.
      # @return [String] Converted string
      #
      def to_path_name(str)
        # Source available in the toys-core gem
      end

      ##
      # Convert the given string to a module name. Specifically, converts
      # to `UpperCamelCase`, and then to a symbol.
      #
      # @param str [String,Symbol] String to convert.
      # @return [Symbol] Converted name
      #
      def to_module_name(str)
        # Source available in the toys-core gem
      end

      ##
      # Given a require path, return the module expected to be defined.
      #
      # @param path [String] File path, delimited by forward slash
      # @return [Module] The module loaded from that path
      #
      def path_to_module(path)
        # Source available in the toys-core gem
      end
    end

    ##
    # Create an empty ModuleLookup
    #
    def initialize
      # Source available in the toys-core gem
    end

    ##
    # Add a lookup path for modules.
    #
    # @param path_base [String] The base require path
    # @param module_base [Module] The base module, or `nil` (the default) to
    #     infer a default from the path base.
    # @param high_priority [Boolean] If true, add to the head of the lookup
    #     path, otherwise add to the end.
    # @return [self]
    #
    def add_path(path_base, module_base: nil, high_priority: false)
      # Source available in the toys-core gem
    end

    ##
    # Obtain a named module. Returns `nil` if the name is not present.
    #
    # @param name [String,Symbol] The name of the module to return.
    # @return [Module] The specified module
    #
    def lookup(name)
      # Source available in the toys-core gem
    end
  end
end
