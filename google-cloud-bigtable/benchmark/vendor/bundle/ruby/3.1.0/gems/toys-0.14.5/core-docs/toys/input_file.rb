##
# **_Defined in the toys-core gem_**
#
# This module is a namespace for constant scopes. Whenever a configuration file
# is parsed, a module is created under this parent for that file's constants.
#
module Toys::InputFile # rubocop:disable Style/ClassAndModuleChildren
  ##
  # @private This interface is internal and subject to change without warning.
  #
  def self.evaluate(tool_class, words, priority, remaining_words, source, loader)
    # Source available in the toys-core gem
  end
end
