module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A settings class defines the structure of application settings, i.e. the
  # various fields that can be set, and their types. You can define a settings
  # structure by subclassing this base class, and using the provided methods.
  #
  # ### Attributes
  #
  # To define an attribute, use the {Settings.settings_attr} declaration.
  #
  # Example:
  #
  #     class ServiceSettings < Toys::Settings
  #       settings_attr :endpoint, default: "api.example.com"
  #     end
  #
  #     my_settings = ServiceSettings.new
  #     my_settings.endpoint_set?   # => false
  #     my_settings.endpoint        # => "api.example.com"
  #     my_settings.endpoint = "rest.example.com"
  #     my_settings.endpoint_set?   # => true
  #     my_settings.endpoint        # => "rest.example.com"
  #     my_settings.endpoint_unset!
  #     my_settings.endpoint_set?   # => false
  #     my_settings.endpoint        # => "api.example.com"
  #
  # An attribute has a name, a default value, and a type specification. The
  # name is used to define methods for getting and setting the attribute. The
  # default is returned if no value is set. (See the section below on parents
  # and defaults for more information.) The type specification governs what
  # values are allowed. (See the section below on type specifications.)
  #
  # Attribute names must start with an ascii letter, and may contain only ascii
  # letters, digits, and underscores. Unlike method names, they may not include
  # non-ascii unicode characters, nor may they end with `!` or `?`.
  # Additionally, the name `method_missing` is not allowed because of its
  # special behavior in Ruby.
  #
  # Each attribute defines four methods: a getter, a setter, an unsetter, and a
  # set detector. In the above example, the attribute named `:endpoint` creates
  # the following four methods:
  #
  #  *  `endpoint` - retrieves the attribute value, or a default if not set.
  #  *  `endpoint=(value)` - sets a new attribute value.
  #  *  `endpoint_unset!` - unsets the attribute, reverting to a default.
  #  *  `endpoint_set?` - returns a boolean, whether the attribute is set.
  #
  # ### Groups
  #
  # A group is a settings field that itself is a Settings object. You can use
  # it to group settings fields in a hierarchy.
  #
  # Example:
  #
  #     class ServiceSettings < Toys::Settings
  #       settings_attr :endpoint, default: "api.example.com"
  #       settings_group :service_flags do
  #         settings_attr :verbose, default: false
  #         settings_attr :use_proxy, default: false
  #       end
  #     end
  #
  #     my_settings = ServiceSettings.new
  #     my_settings.service_flags.verbose      # => false
  #     my_settings.service_flags.verbose = true
  #     my_settings.service_flags.verbose      # => true
  #     my_settings.endpoint                   # => "api.example.com"
  #
  # You can define a group inline, as in the example above, or create an
  # explicit settings class and use it for the group. For example:
  #
  #     class Flags < Toys::Settings
  #       settings_attr :verbose, default: false
  #       settings_attr :use_proxy, default: false
  #     end
  #     class ServiceSettings < Toys::Settings
  #       settings_attr :endpoint, default: "api.example.com"
  #       settings_group :service_flags, Flags
  #     end
  #
  #     my_settings = ServiceSettings.new
  #     my_settings.service_flags.verbose = true
  #
  # If the module enclosing a subclass of `Settings` is itself a subclass of
  # `Settings`, then the class is automatically added to its enclosing class as
  # a group. For example:
  #
  #     class ServiceSettings < Toys::Settings
  #       settings_attr :endpoint, default: "api.example.com"
  #       # Automatically adds this as the group service_flags.
  #       # The name is inferred (snake_cased) from the class name.
  #       class ServiceFlags < Toys::Settings
  #         settings_attr :verbose, default: false
  #         settings_attr :use_proxy, default: false
  #       end
  #     end
  #
  #     my_settings = ServiceSettings.new
  #     my_settings.service_flags.verbose = true
  #
  # ### Type specifications
  #
  # A type specification is a restriction on the types of values allowed for a
  # settings field. Every attribute has a type specification. You can set it
  # explicitly by providing a `:type` argument or a block. If a type
  # specification is not provided explicitly, it is inferred from the default
  # value of the attribute.
  #
  # Type specifications can be any of the following:
  #
  #  *  A Module, restricting values to those that include the module.
  #
  #     For example, a type specification of `Enumerable` would accept `[123]`
  #     but not `123`.
  #
  #  *  A Class, restricting values to that class or any subclass.
  #
  #     For example, a type specification of `Time` would accept `Time.now` but
  #     not `DateTime.now`.
  #
  #     Note that some classes will convert (i.e. parse) strings. For example,
  #     a type specification of `Integer` will accept the string `"-123"`` and
  #     convert it to the value `-123`. Classes that support parsing include:
  #
  #      *  `Date`
  #      *  `DateTime`
  #      *  `Float`
  #      *  `Integer`
  #      *  `Regexp`
  #      *  `Symbol`
  #      *  `Time`
  #
  #  *  A Regexp, restricting values to strings matching the regexp.
  #
  #     For example, a type specification of `/^\w+$/` would match `"abc"` but
  #     not `"abc!"`.
  #
  #  *  A Range, restricting values to objects that fall in the range and are
  #     of the same class (or a subclass) as the endpoints. String values are
  #     accepted if they can be converted to the endpoint class as specified by
  #     a class type specification.
  #
  #     For example, a type specification of `(1..5)` would match `5` but not
  #     `6`. It would also match `"5"` because the String can be parsed into an
  #     Integer in the range.
  #
  #  *  A specific value, any Symbol, String, Numeric, or the values `nil`,
  #     `true`, or `false`, restricting the value to only that given value.
  #
  #     For example, a type specification of `:foo` would match `:foo` but not
  #     `:bar`.
  #
  #     (It might not seem terribly useful to have an attribute that can take
  #     only one value, but this type is generally used as part of a union
  #     type, described below, to implement an enumeration.)
  #
  #  *  An Array representing a union type, each of whose elements is one of
  #     the above types. Values are accepted if they match any of the elements.
  #
  #     For example, a type specification of `[:a, :b :c]` would match `:a` but
  #     not `"a"`. Similarly, a type specification of `[String, Integer, nil]`
  #     would match `"hello"`, `123`, or `nil`, but not `123.4`.
  #
  #  *  A Proc that takes the proposed value and returns either the value if it
  #     is legal, the converted value if it can be converted to a legal value,
  #     or the constant {Toys::Settings::ILLEGAL_VALUE} if it cannot be
  #     converted to a legal value. You may also pass a block to
  #     `settings_attr` to set a Proc type specification.
  #
  #  *  A {Toys::Settings::Type} that checks and converts values.
  #
  # If you do not explicitly provide a type specification, one is inferred from
  # the attribute's default value. The rules are:
  #
  #  *  If the default value is `true` or `false`, then the type specification
  #     inferred is `[true, false]`.
  #
  #  *  If the default value is `nil` or not provided, then the type
  #     specification allows any object (i.e. is equivalent to `Object`).
  #
  #  *  Otherwise, the type specification allows any value of the same class as
  #     the default value. For example, if the default value is `""`, the
  #     effective type specification is `String`.
  #
  # Examples:
  #
  #     class ServiceSettings < Toys::Settings
  #       # Allows only strings because the default is a string.
  #       settings_attr :endpoint, default: "example.com"
  #     end
  #
  #     class ServiceSettings < Toys::Settings
  #       # Allows strings or nil.
  #       settings_attr :endpoint, default: "example.com", type: [String, nil]
  #     end
  #
  #     class ServiceSettings < Toys::Settings
  #       # Raises ArgumentError because the default is nil, which does not
  #       # match the type specification. (You should either allow nil
  #       # explicitly with `type: [String, nil]` or set the default to a
  #       # suitable string such as the empty string "".)
  #       settings_attr :endpoint, type: String
  #     end
  #
  # ### Settings parents
  #
  # A settings object can have a "parent" which provides the values if they are
  # not set in the settings object. This lets you organize settings as
  # "defaults" and "overrides". A parent settings object provides the defaults,
  # and a child can selectively override certain values.
  #
  # To set the parent for a settings object, pass it as the argument to the
  # Settings constructor. When a field in a settings object is queried, it
  # looks up the value as follows:
  #
  #  *  If a field value is explicitly set in the settings object, that value
  #     is returned.
  #  *  If the field is not set in the settings object, but the settings object
  #     has a parent, the parent is queried. If that parent also does not have
  #     a value for the field, it may query its parent in turn, and so forth.
  #  *  If we encounter a root settings with no parent, and still no value is
  #     set for the field, the default is returned.
  #
  # Example:
  #
  #     class MySettings < Toys::Settings
  #       settings_attr :str, default: "default"
  #     end
  #
  #     root_settings = MySettings.new
  #     child_settings = MySettings.new(root_settings)
  #     child_settings.str        # => "default"
  #     root_settings.str = "value_from_root"
  #     child_settings.str        # => "value_from_root"
  #     child_settings.str = "value_from_child"
  #     child_settings.str        # => "value_from_child"
  #     child_settings.str_unset!
  #     child_settings.str        # => "value_from_root"
  #     root_settings.str_unset!
  #     child_settings.str        # => "default"
  #
  # Parents are honored through groups as well. For example:
  #
  #     class MySettings < Toys::Settings
  #       settings_group :flags do
  #         settings_attr :verbose, default: false
  #         settings_attr :force, default: false
  #       end
  #     end
  #
  #     root_settings = MySettings.new
  #     child_settings = MySettings.new(root_settings)
  #     child_settings.flags.verbose       # => false
  #     root_settings.flags.verbose = true
  #     child_settings.flags.verbose       # => true
  #
  # Usually, a settings and its parent (and its parent, and so forth) should
  # have the same class. This guarantees that they define the same fields with
  # the same type specifications. However, this is not required. If a parent
  # does not define a particular field, it is treated as if that field is
  # unset, and lookup proceeds to its parent. To illustrate:
  #
  #     class Settings1 < Toys::Settings
  #       settings_attr :str, default: "default"
  #     end
  #     class Settings2 < Toys::Settings
  #     end
  #
  #     root_settings = Settings1.new
  #     child_settings = Settings2.new(root_settings)  # does not have str
  #     grandchild_settings = Settings1.new(child_settings)
  #
  #     grandchild_settings.str        # => "default"
  #     root_settings.str = "value_from_root"
  #     grandchild_settings.str        # => "value_from_root"
  #
  # Type specifications are enforced when falling back to parent values. If a
  # parent provides a value that is not allowed, it is treated as if the field
  # is unset, and lookup proceeds to its parent.
  #
  #     class Settings1 < Toys::Settings
  #       settings_attr :str, default: "default"  # type spec is String
  #     end
  #     class Settings2 < Toys::Settings
  #       settings_attr :str, default: 0  # type spec is Integer
  #     end
  #
  #     root_settings = Settings1.new
  #     child_settings = Settings2.new(root_settings)
  #     grandchild_settings = Settings1.new(child_settings)
  #
  #     grandchild_settings.str        # => "default"
  #     child_settings.str = 123       # does not match grandchild's type
  #     root_settings.str = "value_from_root"
  #     grandchild_settings.str        # => "value_from_root"
  #
  class Settings
    # A special value indicating a type check failure.
    ILLEGAL_VALUE = ::Object.new.freeze

    # A special type specification indicating infer from the default value.
    DEFAULT_TYPE = ::Object.new.freeze

    ##
    # **_Defined in the toys-core gem_**
    #
    # Error raised when a value does not match the type constraint.
    #
    class FieldError < ::StandardError
      ##
      # The value that did not match
      # @return [Object]
      #
      attr_reader :value

      ##
      # The settings class that rejected the value
      # @return [Class]
      #
      attr_reader :settings_class

      ##
      # The field that rejected the value
      # @return [Symbol]
      #
      attr_reader :field_name

      ##
      # A description of the type constraint, or nil if the field didn't exist.
      # @return [String, nil]
      #
      attr_reader :type_description

      ##
      # @private This interface is internal and subject to change without warning.
      #
      def initialize(value, settings_class, field_name, type_description)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A type object that checks values.
    #
    # A Type includes a description string and a testing function. The testing
    # function takes a proposed value and returns either the value itself if it
    # is valid, a converted value if the value can be converted to a valid
    # value, or {ILLEGAL_VALUE} if the type check failed.
    #
    class Type
      ##
      # Create a new Type.
      #
      # @param description [String] Name of the type.
      # @param block [Proc] A testing function.
      #
      def initialize(description, &block)
        # Source available in the toys-core gem
      end

      ##
      # The name of the type.
      # @return [String]
      #
      attr_reader :description

      ##
      # Test a value, possibly converting to a legal value.
      #
      # @param val [Object] The value to be tested.
      # @return [Object] The validated value, the value converted to a legal
      #     value, or {ILLEGAL_VALUE} if the type check is unsuccessful.
      #
      def call(val)
        # Source available in the toys-core gem
      end

      class << self
        ##
        # Create and return a Type given a type specification. See the
        # {Settings} class documentation for valid type specifications.
        #
        # @param type_spec [Object]
        # @return [Type]
        # @raise [ArgumentError] if the type specification is invalid.
        #
        def for_type_spec(type_spec)
          # Source available in the toys-core gem
        end

        ##
        # Create and return a Type given a default value. See the {Settings}
        # class documentation for the rules.
        #
        # @param value [Object]
        # @return [Type]
        #
        def for_default_value(value)
          # Source available in the toys-core gem
        end
      end
    end

    ##
    # Create a settings instance.
    #
    # @param parent [Settings,nil] Optional parent settings.
    #
    def initialize(parent: nil)
      # Source available in the toys-core gem
    end

    ##
    # Load the given hash of data into this settings object.
    #
    # @param data [Hash] The data as a hash of key-value pairs.
    # @param raise_on_failure [boolean] If `true`, raises an exception on the
    #     first error encountered. If `false`, continues parsing and returns an
    #     array of the errors raised.
    # @return [Array<FieldError>] An array of errors.
    #
    def load_data!(data, raise_on_failure: false)
      # Source available in the toys-core gem
    end

    ##
    # Parse the given YAML string and load the data into this settings object.
    #
    # @param str [String] The YAML-formatted string.
    # @param raise_on_failure [boolean] If `true`, raises an exception on the
    #     first error encountered. If `false`, continues parsing and returns an
    #     array of the errors raised.
    # @return [Array<FieldError>] An array of errors.
    #
    def load_yaml!(str, raise_on_failure: false)
      # Source available in the toys-core gem
    end

    ##
    # Parse the given YAML file and load the data into this settings object.
    #
    # @param filename [String] The path to the YAML-formatted file.
    # @param raise_on_failure [boolean] If `true`, raises an exception on the
    #     first error encountered. If `false`, continues parsing and returns an
    #     array of the errors raised.
    # @return [Array<FieldError>] An array of errors.
    #
    def load_yaml_file!(filename, raise_on_failure: false)
      # Source available in the toys-core gem
    end

    ##
    # Parse the given JSON string and load the data into this settings object.
    #
    # @param str [String] The JSON-formatted string.
    # @param raise_on_failure [boolean] If `true`, raises an exception on the
    #     first error encountered. If `false`, continues parsing and returns an
    #     array of the errors raised.
    # @return [Array<FieldError>] An array of errors.
    #
    def load_json!(str, raise_on_failure: false, **json_opts)
      # Source available in the toys-core gem
    end

    ##
    # Parse the given JSON file and load the data into this settings object.
    #
    # @param filename [String] The path to the JSON-formatted file.
    # @param raise_on_failure [boolean] If `true`, raises an exception on the
    #     first error encountered. If `false`, continues parsing and returns an
    #     array of the errors raised.
    # @return [Array<FieldError>] An array of errors.
    #
    def load_json_file!(filename, raise_on_failure: false, **json_opts)
      # Source available in the toys-core gem
    end

    class << self
      ##
      # Add an attribute field.
      #
      # @param name [Symbol,String] The name of the attribute.
      # @param default [Object] Optional. The final default value if the field
      #     is not set in this settings object or any of its ancestors. If not
      #     provided, `nil` is used.
      # @param type [Object] Optional. The type specification. If not provided,
      #     one is inferred from the default value.
      #
      def settings_attr(name, default: nil, type: DEFAULT_TYPE, &block)
        # Source available in the toys-core gem
      end

      ##
      # Add a group field.
      #
      # Specify the group's structure by passing either a class (which must
      # subclass Settings) or a block (which will be called on the group's
      # class.)
      #
      # @param name [Symbol, String] The name of the group.
      # @param klass [Class] Optional. The class of the group (which must
      #     subclass Settings). If not present, an anonymous subclass will be
      #     created, and you must provide a block to configure it.
      #
      def settings_group(name, klass = nil, &block)
        # Source available in the toys-core gem
      end

      ##
      # @private This interface is internal and subject to change without warning.
      #
      # Returns the fields hash. This is shared between the settings class and
      # all its instances.
      #
      def fields
        # Source available in the toys-core gem
      end
    end
  end
end
