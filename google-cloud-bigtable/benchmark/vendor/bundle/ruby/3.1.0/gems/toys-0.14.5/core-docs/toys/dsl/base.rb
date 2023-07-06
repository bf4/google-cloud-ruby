##
# Create a base class for defining a tool with a given name.
#
# This method returns a base class for defining a tool with a given name.
# This is useful if the naming behavior of {Toys::Tool} is not adequate for
# your tool.
#
# ### Example
#
#     class FooBar < Toys.Tool("Foo_Bar")
#       desc "This is a tool called Foo_Bar"
#
#       def run
#         puts "Foo_Bar called"
#       end
#     end
#
# @param name [String] Name of the tool. Defaults to a name inferred from the
#     class name. (See {Toys::Tool}.)
# @param base [Class] Use this tool class as the base class, and inherit helper
#     methods from it.
# @param args [String,Class] Any string-valued positional argument is
#     interpreted as the name. Any class-valued positional argument is
#     interpreted as the base class.
#
def Toys.Tool(*args, name: nil, base: nil)
  # Source available in the toys-core gem
end

module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # Base class for defining tools
  #
  # This base class provides an alternative to the {Toys::DSL::Tool#tool}
  # directive for defining tools in the Toys DSL. Creating a subclass of
  # `Toys::Tool` will create a tool whose name is the "kebab-case" of the class
  # name. Subclasses can be created only in the context of a tool configuration
  # DSL. Furthermore, a class-defined tool can be created only at the top level
  # of a configuration file, or within another class-defined tool. It cannot
  # be a subtool of a tool block.
  #
  # ### Example
  #
  #     class FooBar < Toys::Tool
  #       desc "This is a tool called foo-bar"
  #
  #       def run
  #         puts "foo-bar called"
  #       end
  #     end
  #
  class Tool < Context
  end
end
