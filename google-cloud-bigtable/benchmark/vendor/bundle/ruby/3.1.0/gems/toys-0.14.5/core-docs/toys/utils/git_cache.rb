module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # This object provides cached access to remote git data. Given a remote
    # repository, a path, and a commit, it makes the files availble in the
    # local filesystem. Access is cached, so repeated requests for the same
    # commit and path in the same repo do not hit the remote repository again.
    #
    # This class is used by the Loader to load tools from git. Tools can also
    # use the `:git_cache` mixin for direct access to this class.
    #
    class GitCache
      ##
      # **_Defined in the toys-core gem_**
      #
      # GitCache encountered a failure
      #
      class Error < ::StandardError
        ##
        # Create a GitCache::Error.
        #
        # @param message [String] The error message
        # @param result [Toys::Utils::Exec::Result] The result of a git
        #     command execution, or `nil` if this error was not due to a git
        #     command error.
        #
        def initialize(message, result)
          # Source available in the toys-core gem
        end

        ##
        # @return [Toys::Utils::Exec::Result] The result of a git command
        #     execution, or `nil` if this error was not due to a git command
        #     error.
        #
        attr_reader :exec_result
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Information about a remote git repository in the cache.
      #
      # This object is returned from {GitCache#repo_info}.
      #
      class RepoInfo
        include ::Comparable

        ##
        # The base directory of this git repository's cache entry. This
        # directory contains all cached data related to this repo. Deleting it
        # effectively removes the repo from the cache.
        #
        # @return [String]
        #
        attr_reader :base_dir

        ##
        # The git remote, usually a file system path or URL.
        #
        # @return [String]
        #
        attr_reader :remote

        ##
        # The last time any cached data from this repo was accessed, or `nil`
        # if the information is unavailable.
        #
        # @return [Time,nil]
        #
        attr_reader :last_accessed

        ##
        # A list of git refs (branches, tags, shas) that have been accessed
        # from this repo.
        #
        # @return [Array<RefInfo>]
        #
        attr_reader :refs

        ##
        # A list of shared source files and directories accessed for this repo.
        #
        # @return [Array<SourceInfo>]
        #
        attr_reader :sources

        ##
        # Convert this RepoInfo to a hash suitable for JSON output
        #
        # @return [Hash]
        #
        def to_h
          # Source available in the toys-core gem
        end

        ##
        # Comparison function
        #
        # @param other [RepoInfo]
        # @return [Integer]
        #
        def <=>(other)
          # Source available in the toys-core gem
        end
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Information about a git ref used in a cache.
      #
      class RefInfo
        include ::Comparable

        ##
        # The git ref
        #
        # @return [String]
        #
        attr_reader :ref

        ##
        # The git sha last associated with the ref
        #
        # @return [String]
        #
        attr_reader :sha

        ##
        # The timestamp when this ref was last accessed
        #
        # @return [Time]
        #
        attr_reader :last_accessed

        ##
        # The timestamp when this ref was last updated
        #
        # @return [Time]
        #
        attr_reader :last_updated

        ##
        # Convert this RefInfo to a hash suitable for JSON output
        #
        # @return [Hash]
        #
        def to_h
          # Source available in the toys-core gem
        end

        ##
        # Comparison function
        #
        # @param other [RefInfo]
        # @return [Integer]
        #
        def <=>(other)
          # Source available in the toys-core gem
        end
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # Information about shared source files provided from the cache.
      #
      class SourceInfo
        include ::Comparable

        ##
        # The git sha the source comes from
        #
        # @return [String]
        #
        attr_reader :sha

        ##
        # The path within the git repo
        #
        # @return [String]
        #
        attr_reader :git_path

        ##
        # The path to the source file or directory
        #
        # @return [String]
        #
        attr_reader :source

        ##
        # The timestamp when this ref was last accessed
        #
        # @return [Time]
        #
        attr_reader :last_accessed

        ##
        # Convert this SourceInfo to a hash suitable for JSON output
        #
        # @return [Hash]
        #
        def to_h
          # Source available in the toys-core gem
        end

        ##
        # Comparison function
        #
        # @param other [SourceInfo]
        # @return [Integer]
        #
        def <=>(other)
          # Source available in the toys-core gem
        end
      end

      ##
      # Access a git cache.
      #
      # @param cache_dir [String] The path to the cache directory. Defaults to
      #     a specific directory in the user's XDG cache.
      #
      def initialize(cache_dir: nil)
        # Source available in the toys-core gem
      end

      ##
      # The cache directory.
      #
      # @return [String]
      #
      attr_reader :cache_dir

      ##
      # Get the given git-based files from the git cache, loading from the
      # remote repo if necessary.
      #
      # The resulting files are either copied into a directory you provide in
      # the `:into` parameter, or populated into a _shared_ source directory if
      # you omit the `:info` parameter. In the latter case, it is important
      # that you do not modify the returned files or directories, nor add or
      # remove any files from the directories returned, to avoid confusing
      # callers that could be given the same directory. If you need to make any
      # modifications to the returned files, use `:into` to provide your own
      # private directory.
      #
      # @param remote [String] The URL of the git repo. Required.
      # @param path [String] The path to the file or directory within the repo.
      #     Optional. Defaults to the entire repo.
      # @param commit [String] The commit reference, which may be a SHA or any
      #     git ref such as a branch or tag. Optional. Defaults to `HEAD`.
      # @param into [String] If provided, copies the specified files into the
      #     given directory path. If omitted or `nil`, populates and returns a
      #     shared source file or directory.
      # @param update [Boolean,Integer] Whether to update of non-SHA commit
      #     references if they were previously loaded. This is useful, for
      #     example, if the commit is `HEAD` or a branch name. Pass `true` or
      #     `false` to specify whether to update, or an integer to update if
      #     last update was done at least that many seconds ago. Default is
      #     `false`.
      #
      # @return [String] The full path to the cached files. The returned path
      #     will correspod to the path given. For example, if you provide the
      #     path `Gemfile` representing a single file in the repository, the
      #     returned path will point directly to the cached copy of that file.
      #
      def get(remote, path: nil, commit: nil, into: nil, update: false, timestamp: nil)
        # Source available in the toys-core gem
      end
      alias find get

      ##
      # Returns an array of the known remote names.
      #
      # @return [Array<String>]
      #
      def remotes
        # Source available in the toys-core gem
      end

      ##
      # Returns a {RepoInfo} describing the cache for the given remote, or
      # `nil` if the given remote has never been cached.
      #
      # @param remote [String] Remote name for a repo
      # @return [RepoInfo,nil]
      #
      def repo_info(remote)
        # Source available in the toys-core gem
      end

      ##
      # Removes caches for the given repos, or all repos if specified.
      #
      # Removes all cache information for the specified repositories, including
      # local clones and shared source directories. The next time these
      # repositories are requested, they will be reloaded from the remote
      # repository from scratch.
      #
      # Be careful not to remove repos that are currently in use by other
      # GitCache clients.
      #
      # @param remotes [Array<String>,:all] The remotes to remove.
      # @return [Array<String>] The remotes actually removed.
      #
      def remove_repos(remotes)
        # Source available in the toys-core gem
      end

      ##
      # Remove records of the given refs (i.e. branches, tags, or `HEAD`) from
      # the given repository's cache. The next time those refs are requested,
      # they will be pulled from the remote repo.
      #
      # If you provide the `refs:` argument, only those refs are removed.
      # Otherwise, all refs are removed.
      #
      # @param remote [String] The repository
      # @param refs [Array<String>] The refs to remove. Optional.
      # @return [Array<RefInfo>,nil] The refs actually forgotten, or `nil` if
      #     the given repo is not in the cache.
      #
      def remove_refs(remote, refs: nil)
        # Source available in the toys-core gem
      end

      ##
      # Removes shared sources for the given cache. The next time a client
      # requests them, the removed sources will be recopied from the repo.
      #
      # If you provide the `commits:` argument, only sources associated with
      # those commits are removed. Otherwise, all sources are removed.
      #
      # Be careful not to remove sources that are currently in use by other
      # GitCache clients.
      #
      # @param remote [String] The repository
      # @param commits [Array<String>] Remove only the sources for the given
      #     commits. Optional.
      # @return [Array<SourceInfo>,nil] The sources actually removed, or `nil`
      #     if the given repo is not in the cache.
      #
      def remove_sources(remote, commits: nil)
        # Source available in the toys-core gem
      end
    end
  end
end
