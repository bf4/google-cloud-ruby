module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A middleware is an object that has the opportunity to alter the
  # configuration and runtime behavior of each tool in a Toys CLI. A CLI
  # contains an ordered list of middleware, known as the *middleware stack*,
  # that together define the CLI's default behavior.
  #
  # Specifically, a middleware can perform two functions.
  #
  # First, it can modify the configuration of a tool. After tools are defined
  # from configuration, the middleware stack can make modifications to each
  # tool. A middleware can add flags and arguments to the tool, modify the
  # description, or make any other changes to how the tool is set up.
  #
  # Second, a middleware can intercept and change tool execution. Like a Rack
  # middleware, a Toys middleware can wrap execution with its own code,
  # replace it outright, or leave it unmodified.
  #
  # Generally, a middleware is a class that implements one or more of the
  # methods defined in this module: {Toys::Middleware#config}, and
  # {Toys::Middleware#run}. This module provides default implementations that
  # do nothing, but using them is not required. Middleware objects need respond
  # only to methods they care about.
  #
  module Middleware
    ##
    # This method is called *after* a tool has been defined, and gives this
    # middleware the opportunity to modify the tool definition. It is passed
    # the tool definition object and the loader, and can make any changes to
    # the tool definition. In most cases, this method should also call
    # `yield`, which passes control to the next middleware in the stack. A
    # middleware can disable modifications done by subsequent middleware by
    # omitting the `yield` call, but this is uncommon.
    #
    # This basic implementation does nothing and simply yields to the next
    # middleware.
    #
    # @param tool [Toys::ToolDefinition] The tool definition to modify.
    # @param loader [Toys::Loader] The loader that loaded this tool.
    # @return [void]
    #
    def config(tool, loader)
      # Source available in the toys-core gem
    end

    ##
    # This method is called when the tool is run. It gives the middleware an
    # opportunity to modify the runtime behavior of the tool. It is passed
    # the tool instance (i.e. the object that hosts a tool's `run` method),
    # and you can use this object to access the tool's options and other
    # context data. In most cases, this method should also call `yield`,
    # which passes control to the next middleware in the stack. A middleware
    # can "wrap" normal execution by calling `yield` somewhere in its
    # implementation of this method, or it can completely replace the
    # execution behavior by not calling `yield` at all.
    #
    # Like a tool's `run` method, this method's return value is unused. If
    # you want to output from a tool, write to stdout or stderr. If you want
    # to set the exit status code, call {Toys::Context#exit} on the context.
    #
    # This basic implementation does nothing and simply yields to the next
    # middleware.
    #
    # @param context [Toys::Context] The tool execution context.
    # @return [void]
    #
    def run(context)
      # Source available in the toys-core gem
    end

    class << self
      ##
      # Create a middleware spec.
      #
      # @overload spec(name, *args, **kwargs, &block)
      #   Create a spec indicating a given middleware name should be
      #   instantiated with the given arguments.
      #
      #   @param name [String,Symbol,Class] The middleware name or class
      #   @param args [Array] The arguments to pass to the constructor
      #   @param kwargs [Hash] The keyword arguments to pass to the constructor
      #   @param block [Proc,nil] The block to pass to the constructor
      #   @return [Toys::Middleware::Spec] A spec
      #
      # @overload spec(array)
      #   Create a middleware spec from an array specification.
      #
      #   The array must be 1-4 elements long. The first element must be the
      #   middleware name or class. The other three arguments may include any
      #   or all of the following optional elements, in any order:
      #    *  An array for the positional arguments to pass to the constructor
      #    *  A hash for the keyword arguments to pass to the constructor
      #    *  A proc for the block to pass to the constructor
      #
      #   @param array [Array] The array input
      #   @return [Toys::Middleware::Spec] A spec
      #
      # @overload spec(middleware_object)
      #   Create a spec wrapping an existing middleware object
      #
      #   @param middleware_object [Toys::Middleware] The middleware object
      #   @return [Toys::Middleware::Spec] A spec
      #
      def spec(middleware, *args, **kwargs, &block)
        # Source available in the toys-core gem
      end

      ##
      # Create a {Toys::Middleware::Stack} from an array of middleware specs.
      # Each element may be one of the following:
      #
      #  *  A {Toys::Middleware} object
      #  *  A {Toys::Middleware::Spec}
      #  *  An array whose first element is a middleware name or class, and the
      #     subsequent elements are params that define what to pass to the class
      #     constructor (see {Toys::Middleware.spec})
      #
      # @param input [Array<Toys::Middleware,Toys::Middleware::Spec,Array>]
      # @return [Toys::Middleware::Stack]
      #
      def stack(input)
        # Source available in the toys-core gem
      end

      ##
      # Create a spec from an array specification.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def spec_from_array(array)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A base class that provides default no-op implementation of the middleware
    # interface. This base class may optionally be subclassed by a middleware
    # implementation.
    #
    class Base
      include Middleware
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A middleware specification, including the middleware class and the
    # arguments to pass to the constructor.
    #
    # Use {Toys::Middleware.spec} to create a middleware spec.
    #
    class Spec
      ##
      # Builds a middleware for this spec, given a ModuleLookup for middleware.
      #
      # If this spec wraps an existing middleware object, returns that object.
      # Otherwise, constructs a middleware object from the spec.
      #
      # @param lookup [Toys::ModuleLookup] A module lookup to resolve
      #     middleware names
      # @return [Toys::Middleware] The middleware
      #
      def build(lookup)
        # Source available in the toys-core gem
      end

      ##
      # @return [Toys::Middleware] if this spec wraps a middleware object
      # @return [nil] if this spec represents a class to instantiate
      #
      attr_reader :object

      ##
      # @return [String,Symbol] if this spec represents a middleware name
      # @return [Class] if this spec represents a middleware class
      # @return [nil] if this spec wraps a middleware object
      #
      attr_reader :name

      ##
      # @return [Array] the positional arguments to be passed to a middleware
      #     class constructor, or the empty array if there are no positional
      #     arguments
      # @return [nil] if this spec wraps a middleware object
      #
      attr_reader :args

      ##
      # @return [Hash] the keyword arguments to be passed to a middleware class
      #     constructor, or the empty hash if there are no keyword arguments
      # @return [nil] if this spec wraps a middleware object
      #
      attr_reader :kwargs

      ##
      # @return [Proc] if there is a block argument to be passed to a
      #     middleware class constructor
      # @return [nil] if there is no block argument, or this spec wraps a
      #     middleware object
      #
      attr_reader :block

      ##
      # Equality check
      #
      # @param other [Object]
      # @return [Boolean]
      #
      def ==(other)
        # Source available in the toys-core gem
      end
      alias eql? ==

      ##
      # Return the hash code
      #
      # @return [Integer]
      #
      def hash
        # Source available in the toys-core gem
      end

      ##
      # Internal constructor. Use {Toys::Middleware.spec} instead.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def initialize(object, name, args, kwargs, block)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A stack of middleware specs, which can be applied in order to a tool.
    #
    # A middleware stack is separated into three groups:
    #
    #  *  {#pre_specs}, which are applied first.
    #  *  {#default_specs}, which are applied next. The default specs are set
    #     when the stack is created and are generally not modified.
    #  *  {#post_specs}, which are applied third.
    #
    # When adding middleware to a stack, you should normally add them to the
    # pre or post specs. By default, {Stack#add} appends to the pre specs,
    # inserting new middleware just before the defaults.
    #
    # Use {Toys::Middleware.stack} to create a middleware stack.
    #
    class Stack
      ##
      # The middleware specs that precede the default set.
      # @return [Array<Toys::Middleware:Spec>]
      #
      attr_reader :pre_specs

      ##
      # The default set of middleware specs.
      # @return [Array<Toys::Middleware:Spec>]
      #
      attr_reader :default_specs

      ##
      # The middleware specs that follow the default set.
      # @return [Array<Toys::Middleware:Spec>]
      #
      attr_reader :post_specs

      ##
      # Add a middleware spec to the stack, in the default location, which is
      # at the end of pre_specs). See {Toys::Middleware.spec} for a description
      # of the arguments you can pass.
      #
      # @overload add(name, *args, **kwargs, &block)
      # @overload add(array)
      # @overload add(middleware_object)
      #
      def add(middleware, *args, **kwargs, &block)
        # Source available in the toys-core gem
      end

      ##
      # Duplicate this stack.
      #
      # @return [Toys::Middleware::Stack]
      #
      def dup
        # Source available in the toys-core gem
      end

      ##
      # Build the middleware in this stack.
      #
      # @return [Array<Toys::Middleware>]
      #
      def build(middleware_lookup)
        # Source available in the toys-core gem
      end

      ##
      # Equality check
      #
      # @param other [Object]
      # @return [Boolean]
      #
      def ==(other)
        # Source available in the toys-core gem
      end
      alias eql? ==

      ##
      # Return the hash code
      #
      # @return [Integer]
      #
      def hash
        # Source available in the toys-core gem
      end

      ##
      # Internal constructor. Use {Toys::Middleware.stack} instead.
      #
      # @private This interface is internal and subject to change without warning.
      #
      def initialize(default_specs: nil, pre_specs: nil, post_specs: nil)
        # Source available in the toys-core gem
      end
    end
  end
end
