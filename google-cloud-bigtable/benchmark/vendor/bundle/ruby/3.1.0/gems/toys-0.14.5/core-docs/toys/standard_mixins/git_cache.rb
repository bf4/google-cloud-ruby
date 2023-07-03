module Toys
  module StandardMixins
    ##
    # **_Defined in the toys-core gem_**
    #
    # A mixin that provides a git cache.
    #
    # This mixin provides an instance of {Toys::Utils::GitCache}, providing
    # cached access to files from a remote git repo.
    #
    # Example usage:
    #
    #     include :git_cache
    #
    #     def run
    #       # Pull and cache the HEAD commit from the Toys repo.
    #       dir = git_cache.find("https://github.com/dazuma/toys.git")
    #       # Display the contents of the readme file.
    #       puts File.read(File.join(dir, "README.md"))
    #     end
    #
    module GitCache
      include Mixin

      ##
      # Context key for the GitCache object.
      # @return [Object]
      #
      KEY = ::Object.new.freeze

      ##
      # Access the builtin GitCache.
      #
      # @return [Toys::Utils::GitCache]
      #
      def git_cache
        # Source available in the toys-core gem
      end
    end
  end
end
