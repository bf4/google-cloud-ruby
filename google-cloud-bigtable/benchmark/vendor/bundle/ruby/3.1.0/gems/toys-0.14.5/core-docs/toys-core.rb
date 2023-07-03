##
# **_Defined in the toys-core gem_**
#
# Toys is a configurable command line tool. Write commands in config files
# using a simple DSL, and Toys will provide the command line executable and
# take care of all the details such as argument parsing, online help, and error
# reporting. Toys is designed for software developers, IT professionals, and
# other power users who want to write and organize scripts to automate their
# workflows. It can also be used as a Rake replacement, providing a more
# natural command line interface for your project's build tasks.
#
# This module contains the command line framework underlying Toys. It can be
# used to create command line executables using the Toys DSL and classes.
#
module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # Namespace for DSL classes. These classes provide the directives that can be
  # used in configuration files. Most are defined in {Toys::DSL::Tool}.
  #
  module DSL
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # Namespace for standard middleware classes.
  #
  module StandardMiddleware
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # Namespace for standard mixin classes.
  #
  module StandardMixins
  end

  ##
  # **_Defined in the toys-core gem_**
  #
  # Namespace for common utility classes.
  #
  # These classes are not loaded by default, and must be required explicitly.
  # For example, before using {Toys::Utils::Exec}, you must
  # `require "toys/utils/exec"`.
  #
  module Utils
  end

  class << self
    ##
    # Path to the executable. This can, for example, be invoked to run a subtool
    # in a clean environment.
    #
    # @return [String] if there is an executable
    # @return [nil] if there is no such executable
    #
    attr_accessor :executable_path
  end
end
