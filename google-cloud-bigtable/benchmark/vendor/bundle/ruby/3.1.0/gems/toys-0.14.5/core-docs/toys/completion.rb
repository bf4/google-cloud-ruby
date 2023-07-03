module Toys
  ##
  # **_Defined in the toys-core gem_**
  #
  # A Completion is a callable Proc that determines candidates for shell tab
  # completion. You pass a {Toys::Completion::Context} object (which includes
  # the current string fragment and other information) and it returns an array
  # of candidates, represented by {Toys::Completion::Candidate} objects, for
  # completing the fragment.
  #
  # A useful method here is the class method {Toys::Completion.create} which
  # takes a variety of inputs and returns a suitable completion Proc.
  #
  module Completion
    ##
    # **_Defined in the toys-core gem_**
    #
    # The context in which to determine completion candidates.
    #
    class Context
      ##
      # Create a completion context
      #
      # @param cli [Toys::CLI] The CLI being run. Required.
      # @param previous_words [Array<String>] Array of complete strings that
      #     appeared prior to the fragment to complete.
      # @param fragment_prefix [String] A prefix in the fragment that does not
      #     participate in completion. (e.g. "key=")
      # @param fragment [String] The string fragment to complete.
      # @param params [Hash] Miscellaneous context data
      #
      def initialize(cli:, previous_words: [], fragment_prefix: "", fragment: "", **params)
        # Source available in the toys-core gem
      end

      ##
      # Create a new completion context with the given modifications.
      #
      # @param delta_params [Hash] Replace context data.
      # @return [Toys::Completion::Context]
      #
      def with(**delta_params)
        # Source available in the toys-core gem
      end

      ##
      # The CLI being run.
      # @return [Toys::CLI]
      #
      attr_reader :cli

      ##
      # All previous words.
      # @return [Array<String>]
      #
      attr_reader :previous_words

      ##
      # A non-completed prefix for the current fragment.
      # @return [String]
      #
      attr_reader :fragment_prefix

      ##
      # The current string fragment to complete
      # @return [String]
      #
      attr_reader :fragment

      ##
      # Get data for arbitrary key.
      # @param [Symbol] key
      # @return [Object]
      #
      def [](key)
        # Source available in the toys-core gem
      end
      alias get []

      ##
      # The tool being invoked, which should control the completion.
      # @return [Toys::ToolDefinition]
      #
      def tool
        # Source available in the toys-core gem
      end

      ##
      # An array of complete arguments passed to the tool, prior to the
      # fragment to complete.
      # @return [Array<String>]
      #
      def args
        # Source available in the toys-core gem
      end

      ##
      # Current ArgParser indicating the status of argument parsing up to
      # this point.
      #
      # @return [Toys::ArgParser]
      #
      def arg_parser
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A candidate for completing a string fragment.
    #
    # A candidate includes a string representing the potential completed
    # word, as well as a flag indicating whether it is a *partial* completion
    # (i.e. a prefix that could still be added to) versus a *final* word.
    # Generally, tab completion systems should add a trailing space after a
    # final completion but not after a partial completion.
    #
    class Candidate
      include ::Comparable

      ##
      # Create a new candidate
      # @param string [String] The candidate string
      # @param partial [Boolean] Whether the candidate is partial. Defaults
      #     to `false`.
      #
      def initialize(string, partial: false)
        # Source available in the toys-core gem
      end

      ##
      # Get the candidate string.
      # @return [String]
      #
      attr_reader :string
      alias to_s string

      ##
      # Determine whether the candidate is partial completion.
      # @return [Boolean]
      #
      def partial?
        # Source available in the toys-core gem
      end

      ##
      # Determine whether the candidate is a final completion.
      # @return [Boolean]
      #
      def final?
        # Source available in the toys-core gem
      end

      ##
      # Create an array of candidates given an array of strings.
      #
      # @param array [Array<String>]
      # @return [Array<Toys::Completion::Candidate]
      #
      def self.new_multi(array, partial: false)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A base class that returns no completions.
    #
    # Completions *may* but do not need to subclass this base class. They
    # merely need to duck-type `Proc` by implementing the `call` method.
    #
    class Base
      ##
      # Returns candidates for the current completion.
      # This default implementation returns an empty list.
      #
      # @param context [Toys::Completion::Context] The current completion
      #     context including the string fragment.
      # @return [Array<Toys::Completion::Candidate>] An array of candidates
      #
      def call(context)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A Completion that returns candidates from the local file system.
    #
    class FileSystem < Base
      ##
      # Create a completion that gets candidates from names in the local file
      # system.
      #
      # @param cwd [String] Working directory (defaults to the current dir).
      # @param omit_files [Boolean] Omit files from candidates
      # @param omit_directories [Boolean] Omit directories from candidates
      # @param prefix_constraint [String,Regexp] Constraint on the fragment
      #     prefix. Defaults to requiring the prefix be empty.
      #
      def initialize(cwd: nil, omit_files: false, omit_directories: false, prefix_constraint: "")
        # Source available in the toys-core gem
      end

      ##
      # Whether files are included in the completion candidates.
      # @return [Boolean]
      #
      attr_reader :include_files

      ##
      # Whether directories are included in the completion candidates.
      # @return [Boolean]
      #
      attr_reader :include_directories

      ##
      # Constraint on the fragment prefix.
      # @return [String,Regexp]
      #
      attr_reader :prefix_constraint

      ##
      # Path to the starting directory.
      # @return [String]
      #
      attr_reader :cwd

      ##
      # Returns candidates for the current completion.
      #
      # @param context [Toys::Completion::Context] the current completion
      #     context including the string fragment.
      # @return [Array<Toys::Completion::Candidate>] an array of candidates
      #
      def call(context)
        # Source available in the toys-core gem
      end
    end

    ##
    # **_Defined in the toys-core gem_**
    #
    # A Completion whose candidates come from a static list of strings.
    #
    class Enum < Base
      ##
      # Create a completion from a list of values.
      #
      # @param values [Array<String>]
      # @param prefix_constraint [String,Regexp] Constraint on the fragment
      #     prefix. Defaults to requiring the prefix be empty.
      #
      def initialize(values, prefix_constraint: "")
        # Source available in the toys-core gem
      end

      ##
      # The array of completion candidates.
      # @return [Array<String>]
      #
      attr_reader :values

      ##
      # Constraint on the fragment prefix.
      # @return [String,Regexp]
      #
      attr_reader :prefix_constraint

      ##
      # Returns candidates for the current completion.
      #
      # @param context [Toys::Completion::Context] the current completion
      #     context including the string fragment.
      # @return [Array<Toys::Completion::Candidate>] an array of candidates
      #
      def call(context)
        # Source available in the toys-core gem
      end
    end

    ##
    # An instance of the empty completion that returns no candidates.
    # @return [Toys:::Completion::Base]
    #
    EMPTY = Base.new

    ##
    # Create a completion Proc from a variety of specification formats. The
    # completion is constructed from the given specification object and/or the
    # given block. Additionally, some completions can take a hash of options.
    #
    # Recognized specs include:
    #
    #  *  `:empty`: Returns the empty completion. Any block or options are
    #     ignored.
    #
    #  *  `:file_system`: Returns a completion that searches the current
    #     directory for file and directory names. You may also pass any of the
    #     options recognized by {Toys::Completion::FileSystem#initialize}. The
    #     block is ignored.
    #
    #  *  An **Array** of strings. Returns a completion that uses those values
    #     as candidates. You may also pass any of the options recognized by
    #     {Toys::Completion::Enum#initialize}. The block is ignored.
    #
    #  *  A **function**, either passed as a Proc (where the block is ignored)
    #     or as a block (if the spec is nil). The function must behave as a
    #     completion object, taking {Toys::Completion::Context} as the sole
    #     argument, and returning an array of {Toys::Completion::Candidate}.
    #
    #  *  `:default` and `nil` indicate the **default completion**. For this
    #     method, the default is the empty completion (i.e. these are synonyms
    #     for `:empty`). However, other completion resolution methods might
    #     have a different default.
    #
    # @param spec [Object] See the description for recognized values.
    # @param options [Hash] Additional options to pass to the completion.
    # @param block [Proc] See the description for recognized forms.
    # @return [Toys::Completion::Base,Proc]
    #
    def self.create(spec = nil, **options, &block)
      # Source available in the toys-core gem
    end

    ##
    # Take the various ways to express a completion spec, and convert them to a
    # canonical form expressed as a single object. This is called from the DSL
    # DSL to generate a spec object that can be stored.
    #
    # @private This interface is internal and subject to change without warning.
    #
    def self.scalarize_spec(spec, options, block)
      # Source available in the toys-core gem
    end
  end
end
