module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # Implementations of tab completion.
    #
    # This module is not loaded by default. Before using it directly, you must
    # `require "toys/utils/completion_engine"`
    #
    module CompletionEngine
      ##
      # **_Defined in the toys-core gem_**
      #
      # A completion engine for bash.
      #
      class Bash
        ##
        # Create a bash completion engine.
        #
        # @param cli [Toys::CLI] The CLI.
        #
        def initialize(cli)
          # Source available in the toys-core gem
        end

        ##
        # Perform completion in the current shell environment, which must
        # include settings for the `COMP_LINE` and `COMP_POINT` environment
        # variables. Prints out completion candidates, one per line, and
        # returns a status code indicating the result.
        #
        #  *  **0** for success.
        #  *  **1** if completion failed.
        #  *  **2** if the environment is incorrect (e.g. expected environment
        #     variables not found)
        #
        # @return [Integer] status code
        #
        def run
          # Source available in the toys-core gem
        end
      end

      class << self
      end
    end
  end
end
