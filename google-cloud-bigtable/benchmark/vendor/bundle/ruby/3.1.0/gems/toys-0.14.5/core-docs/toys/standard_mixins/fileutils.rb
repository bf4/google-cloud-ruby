module Toys
  module StandardMixins
    ##
    # **_Defined in the toys-core gem_**
    #
    # A module that provides all methods in the "fileutils" standard library.
    #
    # You may make the methods in the `FileUtils` standard library module
    # available to your tool by including the following directive in your tool
    # configuration:
    #
    #     include :fileutils
    #
    module Fileutils
      include Mixin
    end
  end
end
