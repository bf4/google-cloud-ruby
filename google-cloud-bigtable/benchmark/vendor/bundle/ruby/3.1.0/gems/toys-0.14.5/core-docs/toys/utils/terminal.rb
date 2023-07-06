begin
  require "io/console"
rescue ::LoadError
  # TODO: alternate methods of getting terminal size
end

module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # A simple terminal class.
    #
    # ### Styles
    #
    # This class supports ANSI styled output where supported.
    #
    # Styles may be specified in any of the following forms:
    #  *  A symbol indicating the name of a well-known style, or the name of
    #     a defined style.
    #  *  An rgb string in hex "rgb" or "rrggbb" form.
    #  *  An ANSI code string in `\e[XXm` form.
    #  *  An array of ANSI codes as integers.
    #
    class Terminal
      ##
      # **_Defined in the toys-core gem_**
      #
      # Fatal terminal error.
      #
      class TerminalError < ::StandardError
      end

      ##
      # ANSI style code to clear styles
      # @return [String]
      #
      CLEAR_CODE = "\e[0m"

      ##
      # Standard ANSI style codes by name.
      # @return [Hash{Symbol => Array<Integer>}]
      #
      BUILTIN_STYLE_NAMES = {
        clear: [0],
        reset: [0],
        bold: [1],
        faint: [2],
        italic: [3],
        underline: [4],
        blink: [5],
        reverse: [7],
        black: [30],
        red: [31],
        green: [32],
        yellow: [33],
        blue: [34],
        magenta: [35],
        cyan: [36],
        white: [37],
        on_black: [30],
        on_red: [31],
        on_green: [32],
        on_yellow: [33],
        on_blue: [34],
        on_magenta: [35],
        on_cyan: [36],
        on_white: [37],
        bright_black: [90],
        bright_red: [91],
        bright_green: [92],
        bright_yellow: [93],
        bright_blue: [94],
        bright_magenta: [95],
        bright_cyan: [96],
        bright_white: [97],
        on_bright_black: [100],
        on_bright_red: [101],
        on_bright_green: [102],
        on_bright_yellow: [103],
        on_bright_blue: [104],
        on_bright_magenta: [105],
        on_bright_cyan: [106],
        on_bright_white: [107],
      }.freeze

      ##
      # Default length of a single spinner frame, in seconds.
      # @return [Float]
      #
      DEFAULT_SPINNER_FRAME_LENGTH = 0.1

      ##
      # Default set of spinner frames.
      # @return [Array<String>]
      #
      DEFAULT_SPINNER_FRAMES = ["-", "\\", "|", "/"].freeze

      ##
      # Returns a copy of the given string with all ANSI style codes removed.
      #
      # @param str [String] Input string
      # @return [String] String with styles removed
      #
      def self.remove_style_escapes(str)
        # Source available in the toys-core gem
      end

      ##
      # Create a terminal.
      #
      # @param input [IO,nil] Input stream.
      # @param output [IO,Logger,nil] Output stream or logger.
      # @param styled [Boolean,nil] Whether to output ansi styles. If `nil`, the
      #     setting is inferred from whether the output has a tty.
      #
      def initialize(input: $stdin, output: $stdout, styled: nil)
        # Source available in the toys-core gem
      end

      ##
      # Output stream or logger
      # @return [IO,Logger,nil]
      #
      attr_reader :output

      ##
      # Input stream
      # @return [IO,nil]
      #
      attr_reader :input

      ##
      # Whether output is styled
      # @return [Boolean]
      #
      attr_reader :styled

      ##
      # Write a partial line without appending a newline.
      #
      # @param str [String] The line to write
      # @param styles [Symbol,String,Array<Integer>...] Styles to apply to the
      #     partial line.
      # @return [self]
      #
      def write(str = "", *styles)
        # Source available in the toys-core gem
      end

      ##
      # Read a line, blocking until one is available.
      #
      # @return [String] the entire string including the temrinating newline
      # @return [nil] if the input is closed or at eof, or there is no input
      #
      def readline
        # Source available in the toys-core gem
      end

      ##
      # This method is defined so that `::Logger` will recognize a terminal as
      # a log device target, but it does not actually close anything.
      #
      def close
        # Source available in the toys-core gem
      end

      ##
      # Write a line, appending a newline if one is not already present.
      #
      # @param str [String] The line to write
      # @param styles [Symbol,String,Array<Integer>...] Styles to apply to the
      #     entire line.
      # @return [self]
      #
      def puts(str = "", *styles)
        # Source available in the toys-core gem
      end
      alias say puts

      ##
      # Write a line, appending a newline if one is not already present.
      #
      # @param str [String] The line to write
      # @return [self]
      #
      def <<(str)
        # Source available in the toys-core gem
      end

      ##
      # Write a newline and flush the current line.
      # @return [self]
      #
      def newline
        # Source available in the toys-core gem
      end

      ##
      # Ask a question and get a response.
      #
      # @param prompt [String] Required prompt string.
      # @param styles [Symbol,String,Array<Integer>...] Styles to apply to the
      #     prompt.
      # @param default [String,nil] Default value, or `nil` for no default.
      #     Uses `nil` if not specified.
      # @param trailing_text [:default,String,nil] Trailing text appended to
      #     the prompt, `nil` for none, or `:default` to show the default.
      # @return [String]
      #
      def ask(prompt, *styles, default: nil, trailing_text: :default)
        # Source available in the toys-core gem
      end

      ##
      # Confirm with the user.
      #
      # @param prompt [String] Prompt string. Defaults to `"Proceed?"`.
      # @param styles [Symbol,String,Array<Integer>...] Styles to apply to the
      #     prompt.
      # @param default [Boolean,nil] Default value, or `nil` for no default.
      #     Uses `nil` if not specified.
      # @return [Boolean]
      #
      def confirm(prompt = "Proceed? ", *styles, default: nil)
        # Source available in the toys-core gem
      end

      ##
      # Display a spinner during a task. You should provide a block that
      # performs the long-running task. While the block is executing, a
      # spinner will be displayed.
      #
      # @param leading_text [String] Optional leading string to display to the
      #     left of the spinner. Default is the empty string.
      # @param frame_length [Float] Length of a single frame, in seconds.
      #     Defaults to {DEFAULT_SPINNER_FRAME_LENGTH}.
      # @param frames [Array<String>] An array of frames. Defaults to
      #     {DEFAULT_SPINNER_FRAMES}.
      # @param style [Symbol,Array<Symbol>] A terminal style or array of styles
      #     to apply to all frames in the spinner. Defaults to empty,
      # @param final_text [String] Optional final string to display when the
      #     spinner is complete. Default is the empty string. A common practice
      #     is to set this to newline.
      # @return [Object] The return value of the block.
      #
      def spinner(leading_text: "", final_text: "",
                  frame_length: nil, frames: nil, style: nil)
        # Source available in the toys-core gem
      end

      ##
      # Return the terminal size as an array of width, height.
      #
      # @return [Array(Integer,Integer)]
      #
      def size
        # Source available in the toys-core gem
      end

      ##
      # Return the terminal width
      #
      # @return [Integer]
      #
      def width
        # Source available in the toys-core gem
      end

      ##
      # Return the terminal height
      #
      # @return [Integer]
      #
      def height
        # Source available in the toys-core gem
      end

      ##
      # Define a named style.
      #
      # Style names must be symbols.
      # The definition of a style may include any valid style specification,
      # including the symbol names of existing defined styles.
      #
      # @param name [Symbol] The name for the style
      # @param styles [Symbol,String,Array<Integer>...]
      # @return [self]
      #
      def define_style(name, *styles)
        # Source available in the toys-core gem
      end

      ##
      # Apply the given styles to the given string, returning the styled
      # string. Honors the styled setting; if styling is disabled, does not
      # add any ANSI style codes and in fact removes any existing codes. If
      # styles were added, ensures that the string ends with a clear code.
      #
      # @param str [String] String to style
      # @param styles [Symbol,String,Array<Integer>...] Styles to apply
      # @return [String] The styled string
      #
      def apply_styles(str, *styles)
        # Source available in the toys-core gem
      end
    end
  end
end
