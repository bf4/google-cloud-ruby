module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A FlagGroup is a group of flags with the same requirement settings.
  #
  module FlagGroup
    ##
    # Create a flag group object of the given type.
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
    # @return [Toys::FlagGroup::Base] A flag group of the correct subclass.
    #
    def self.create(type: nil, name: nil, desc: nil, long_desc: nil)
      # Source available in the toys-core gem
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # The base class of a FlagGroup, implementing everything except validation.
    # The base class effectively behaves as an Optional group. And the default
    # group that contains flags not otherwise assigned to a group, is of this
    # type. However, you should use {Toys::FlagGroup::Optional} when creating
    # an explicit optional group.
    #
    class Base
      ##
      # The symbolic name for this group
      # @return [String,Symbol,nil]
      #
      attr_reader :name

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
      #  *  A normal String representing a line. This will be transformed into
      #     a {Toys::WrappableString} using spaces as word delimiters.
      #  *  An Array of String representing a line. This will be transformed
      #     into a {Toys::WrappableString} where each array element represents
      #     an individual word for wrapping.
      #
      # @return [Array<Toys::WrappableString>]
      #
      attr_reader :long_desc

      ##
      # An array of flags that are in this group.
      # Do not modify the returned array.
      # @return [Array<Toys::Flag>]
      #
      attr_reader :flags

      ##
      # Returns true if this group is empty
      # @return [Boolean]
      #
      def empty?
        # Source available in the toys-core gem
      end

      ##
      # Returns a string summarizing this group. This is generally either the
      # short description or a representation of all the flags included.
      # @return [String]
      #
      def summary
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
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A FlagGroup containing all required flags
    #
    class Required < Base
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A FlagGroup containing all optional flags
    #
    class Optional < Base
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A FlagGroup in which exactly one flag must be set
    #
    class ExactlyOne < Base
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A FlagGroup in which at most one flag must be set
    #
    class AtMostOne < Base
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A FlagGroup in which at least one flag must be set
    #
    class AtLeastOne < Base
    end
  end
end
