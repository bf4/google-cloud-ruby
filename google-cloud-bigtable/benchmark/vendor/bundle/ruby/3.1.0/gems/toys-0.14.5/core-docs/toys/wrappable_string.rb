module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A string intended for word-wrapped display.
  #
  # A WrappableString is an array of string "fragments" representing the atomic
  # units that should not be split when word-wrapping. It should be possible to
  # reconstruct the original string by joining these fragments with whitespace.
  #
  class WrappableString
    ##
    # Create a wrapped string.
    #
    # You can pass either:
    #
    #  *  A single String, which will be split into fragments by whitespace.
    #  *  An array of Strings representing the fragments explicitly.
    #
    # @param string [String,Array<String>] The string or array of string
    #     fragments
    #
    def initialize(string = "")
      # Source available in the toys-core gem
    end

    ##
    # Returns the string fragments, i.e. the individual "words" for wrapping.
    #
    # @return [Array<String>]
    #
    attr_reader :fragments

    ##
    # Returns a new WrappaableString whose content is the concatenation of this
    # WrappableString with another WrappableString.
    #
    # @param other [WrappableString]
    # @return [WrappableString]
    #
    def +(other)
      # Source available in the toys-core gem
    end

    ##
    # Returns true if the string is empty (i.e. has no fragments)
    #
    # @return [Boolean]
    #
    def empty?
      # Source available in the toys-core gem
    end

    ##
    # Returns the string without any wrapping
    #
    # @return [String]
    #
    def string
      # Source available in the toys-core gem
    end
    alias to_s string

    ##
    # Tests two wrappable strings for equality
    # @param other [Object]
    # @return [Boolean]
    #
    def ==(other)
      # Source available in the toys-core gem
    end
    alias eql? ==

    ##
    # Returns a hash code for this object
    # @return [Integer]
    #
    def hash
      # Source available in the toys-core gem
    end

    ##
    # Wraps the string to the given width.
    #
    # @param width [Integer,nil] Width in characters, or `nil` for infinite.
    # @param width2 [Integer,nil] Width in characters for the second and
    #     subsequent lines, or `nil` to use the same as width.
    #
    # @return [Array<String>] Wrapped lines
    #
    def wrap(width, width2 = nil)
      # Source available in the toys-core gem
    end

    ##
    # Wraps an array of lines to the given width.
    #
    # @param strs [Array<WrappableString>] Array of strings to wrap.
    # @param width [Integer,nil] Width in characters, or `nil` for infinite.
    # @param width2 [Integer,nil] Width in characters for the second and
    #     subsequent lines, or `nil` to use the same as width.
    #
    # @return [Array<String>] Wrapped lines
    #
    def self.wrap_lines(strs, width, width2 = nil)
      # Source available in the toys-core gem
    end

    ##
    # Make the given object a WrappableString.
    # If the object is already a WrappableString, return it. Otherwise,
    # treat it as a string or an array of strings and wrap it in a
    # WrappableString.
    #
    # @param obj [Toys::WrappableString,String,Array<String>]
    # @return [Toys::WrappableString]
    #
    def self.make(obj)
      # Source available in the toys-core gem
    end

    ##
    # Make the given object an array of WrappableString.
    #
    # @param objs [Array<Toys::WrappableString,String,Array<String>>]
    # @return [Array<Toys::WrappableString>]
    #
    def self.make_array(objs)
      # Source available in the toys-core gem
    end
  end
end
