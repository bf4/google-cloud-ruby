module Toys
  module Utils
    ##
    # **_Defined in the toys-core gem_**
    #
    # A service that executes subprocesses.
    #
    # This service provides a convenient interface for controlling spawned
    # processes and their streams. It also provides shortcuts for common cases
    # such as invoking Ruby in a subprocess or capturing output in a string.
    #
    # This class is not loaded by default. Before using it directly, you should
    # `require "toys/utils/exec"`
    #
    # ### Controlling processes
    #
    # A process can be started in the *foreground* or the *background*. If you
    # start a foreground process, it will "take over" your standard input and
    # output streams by default, and it will keep control until it completes.
    # If you start a background process, its streams will be redirected to null
    # by default, and control will be returned to you immediately.
    #
    # When a process is running, you can control it using a
    # {Toys::Utils::Exec::Controller} object. Use a controller to interact with
    # the process's input and output streams, send it signals, or wait for it
    # to complete.
    #
    # When running a process in the foreground, the controller will be yielded
    # to an optional block. For example, the following code starts a process in
    # the foreground and passes its output stream to a controller.
    #
    #     exec_service.exec(["git", "init"], out: :controller) do |controller|
    #       loop do
    #         line = controller.out.gets
    #         break if line.nil?
    #         puts "Got line: #{line}"
    #       end
    #     end
    #
    # When running a process in the background, the controller is returned from
    # the method that starts the process:
    #
    #     controller = exec_service.exec(["git", "init"], background: true)
    #
    # ### Stream handling
    #
    # By default, subprocess streams are connected to the corresponding streams
    # in the parent process. You can change this behavior, redirecting streams
    # or providing ways to control them, using the `:in`, `:out`, and `:err`
    # options.
    #
    # Three general strategies are available for custom stream handling. First,
    # you can redirect to other streams such as files, IO objects, or Ruby
    # strings. Some of these options map directly to options provided by the
    # `Process#spawn` method. Second, you can use a controller to manipulate
    # the streams programmatically. Third, you can capture output stream data
    # and make it available in the result.
    #
    # Following is a full list of the stream handling options, along with how
    # to specify them using the `:in`, `:out`, and `:err` options.
    #
    #  *  **Inherit parent stream:** You can inherit the corresponding stream
    #     in the parent process by passing `:inherit` as the option value. This
    #     is the default if the subprocess is *not* run in the background.
    #
    #  *  **Redirect to null:** You can redirect to a null stream by passing
    #     `:null` as the option value. This connects to a stream that is not
    #     closed but contains no data, i.e. `/dev/null` on unix systems. This
    #     is the default if the subprocess is run in the background.
    #
    #  *  **Close the stream:** You can close the stream by passing `:close` as
    #     the option value. This is the same as passing `:close` to
    #     `Process#spawn`.
    #
    #  *  **Redirect to a file:** You can redirect to a file. This reads from
    #     an existing file when connected to `:in`, and creates or appends to a
    #     file when connected to `:out` or `:err`. To specify a file, use the
    #     setting `[:file, "/path/to/file"]`. You can also, when writing a
    #     file, append an optional mode and permission code to the array. For
    #     example, `[:file, "/path/to/file", "a", 0644]`.
    #
    #  *  **Redirect to an IO object:** You can redirect to an IO object in the
    #     parent process, by passing the IO object as the option value. You can
    #     use any IO object. For example, you could connect the child's output
    #     to the parent's error using `out: $stderr`, or you could connect to
    #     an existing File stream. Unlike `Process#spawn`, this works for IO
    #     objects that do not have a corresponding file descriptor (such as
    #     StringIO objects). In such a case, a thread will be spawned to pipe
    #     the IO data through to the child process.
    #
    #  *  **Redirect to a pipe:** You can redirect to a pipe created using
    #     `IO.pipe` (i.e. a two-element array of read and write IO objects) by
    #     passing the array as the option value. This will connect the
    #     appropriate IO (either read or write), and close it in the parent.
    #     Thus, you can connect only one process to each end. If you want more
    #     direct control over IO closing behavior, pass the IO object (i.e. the
    #     element of the pipe array) directly.
    #
    #  *  **Combine with another child stream:** You can redirect one child
    #     output stream to another, to combine them. To merge the child's error
    #     stream into its output stream, use `err: [:child, :out]`.
    #
    #  *  **Read from a string:** You can pass a string to the input stream by
    #     setting `[:string, "the string"]`. This works only for `:in`.
    #
    #  *  **Capture output stream:** You can capture a stream and make it
    #     available on the {Toys::Utils::Exec::Result} object, using the
    #     setting `:capture`. This works only for the `:out` and `:err`
    #     streams.
    #
    #  *  **Use the controller:** You can hook a stream to the controller using
    #     the setting `:controller`. You can then manipulate the stream via the
    #     controller. If you pass a block to {Toys::Utils::Exec#exec}, it
    #     yields the {Toys::Utils::Exec::Controller}, giving you access to
    #     streams.
    #
    #  *  **Make copies of an output stream:** You can "tee," or duplicate the
    #     `:out` or `:err` stream and redirect those copies to various
    #     destinations. To specify a tee, use the setting `[:tee, ...]` where
    #     the additional array elements include two or more of the following.
    #     See the corresponding documentation above for more detail.
    #      *  `:inherit` to direct to the parent process's stream.
    #      *  `:capture` to capture the stream and store it in the result.
    #      *  `:controller` to direct the stream to the controller.
    #      *  `[:file, "/path/to/file"]` to write to a file.
    #      *  An `IO` or `StringIO` object.
    #      *  An array of two `IO` objects representing a pipe
    #
    #     Additionally, the last element of the array can be a hash of options.
    #     Supported options include:
    #      *  `:buffer_size` The size of the memory buffer for each element of
    #         the tee. Larger buffers may allow higher throughput. The default
    #         is 65536.
    #
    # ### Result handling
    #
    # A subprocess result is represented by a {Toys::Utils::Exec::Result}
    # object, which includes the exit code, the content of any captured output
    # streams, and any exeption raised when attempting to run the process.
    # When you run a process in the foreground, the method will return a result
    # object. When you run a process in the background, you can obtain the
    # result from the controller once the process completes.
    #
    # The following example demonstrates running a process in the foreground
    # and getting the exit code:
    #
    #     result = exec_service.exec(["git", "init"])
    #     puts "exit code: #{result.exit_code}"
    #
    # The following example demonstrates starting a process in the background,
    # waiting for it to complete, and getting its exit code:
    #
    #     controller = exec_service.exec(["git", "init"], background: true)
    #     result = controller.result(timeout: 1.0)
    #     if result
    #       puts "exit code: #{result.exit_code}"
    #     else
    #       puts "timed out"
    #     end
    #
    # You can also provide a callback that is executed once a process
    # completes. For example:
    #
    #     my_callback = proc do |result|
    #       puts "exit code: #{result.exit_code}"
    #     end
    #     exec_service.exec(["git", "init"], result_callback: my_callback)
    #
    # ### Configuration options
    #
    # A variety of options can be used to control subprocesses. These can be
    # provided to any method that starts a subprocess. Youc an also set
    # defaults by calling {Toys::Utils::Exec#configure_defaults}.
    #
    # Options that affect the behavior of subprocesses:
    #
    #  *  `:env` (Hash) Environment variables to pass to the subprocess.
    #     Keys represent variable names and should be strings. Values should be
    #     either strings or `nil`, which unsets the variable.
    #
    #  *  `:background` (Boolean) Runs the process in the background if `true`.
    #
    #  *  `:result_callback` (Proc) Called and passed the result object when
    #     the subprocess exits.
    #
    # Options for connecting input and output streams. See the section above on
    # stream handling for info on the values that can be passed.
    #
    #  *  `:in` Connects the input stream of the subprocess. See the section on
    #     stream handling.
    #
    #  *  `:out` Connects the standard output stream of the subprocess. See the
    #     section on stream handling.
    #
    #  *  `:err` Connects the standard error stream of the subprocess. See the
    #     section on stream handling.
    #
    # Options related to logging and reporting:
    #
    #  *  `:logger` (Logger) Logger to use for logging the actual command. If
    #     not present, the command is not logged.
    #
    #  *  `:log_level` (Integer,false) Level for logging the actual command.
    #     Defaults to Logger::INFO if not present. You can also pass `false` to
    #     disable logging of the command.
    #
    #  *  `:log_cmd` (String) The string logged for the actual command.
    #     Defaults to the `inspect` representation of the command.
    #
    #  *  `:name` (Object) An optional object that can be used to identify this
    #     subprocess. It is available in the controller and result objects.
    #
    # In addition, the following options recognized by
    # [`Process#spawn`](https://ruby-doc.org/core/Process.html#method-c-spawn)
    # are supported.
    #
    #  *  `:chdir` (String) Set the working directory for the command.
    #
    #  *  `:close_others` (Boolean) Whether to close non-redirected
    #     non-standard file descriptors.
    #
    #  *  `:new_pgroup` (Boolean) Create new process group (Windows only).
    #
    #  *  `:pgroup` (Integer,true,nil) The process group setting.
    #
    #  *  `:umask` (Integer) Umask setting for the new process.
    #
    #  *  `:unsetenv_others` (Boolean) Clear environment variables except those
    #     explicitly set.
    #
    # Any other option key will result in an `ArgumentError`.
    #
    class Exec
      ##
      # Create an exec service.
      #
      # @param block [Proc] A block that is called if a key is not found. It is
      #     passed the unknown key, and expected to return a default value
      #     (which can be nil).
      # @param opts [keywords] Initial default options. See {Toys::Utils::Exec}
      #     for a description of the options.
      #
      def initialize(**opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # Set default options. See {Toys::Utils::Exec} for a description of the
      # options.
      #
      # @param opts [keywords] New default options to set
      # @return [self]
      #
      def configure_defaults(**opts)
        # Source available in the toys-core gem
      end

      ##
      # Execute a command. The command can be given as a single string to pass
      # to a shell, or an array of strings indicating a posix command.
      #
      # If the process is not set to run in the background, and a block is
      # provided, a {Toys::Utils::Exec::Controller} will be yielded to it.
      #
      # @param cmd [String,Array<String>] The command to execute.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [Toys::Utils::Exec::Controller] The subprocess controller, if
      #     the process is running in the background.
      # @return [Toys::Utils::Exec::Result] The result, if the process ran in
      #     the foreground.
      #
      def exec(cmd, **opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # Spawn a ruby process and pass the given arguments to it.
      #
      # If the process is not set to run in the background, and a block is
      # provided, a {Toys::Utils::Exec::Controller} will be yielded to it.
      #
      # @param args [String,Array<String>] The arguments to ruby.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [Toys::Utils::Exec::Controller] The subprocess controller, if
      #     the process is running in the background.
      # @return [Toys::Utils::Exec::Result] The result, if the process ran in
      #     the foreground.
      #
      def exec_ruby(args, **opts, &block)
        # Source available in the toys-core gem
      end
      alias ruby exec_ruby

      ##
      # Execute a proc in a fork.
      #
      # If the process is not set to run in the background, and a block is
      # provided, a {Toys::Utils::Exec::Controller} will be yielded to it.
      #
      # @param func [Proc] The proc to call.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [Toys::Utils::Exec::Controller] The subprocess controller, if
      #     the process is running in the background.
      # @return [Toys::Utils::Exec::Result] The result, if the process ran in
      #     the foreground.
      #
      def exec_proc(func, **opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # Execute a command. The command can be given as a single string to pass
      # to a shell, or an array of strings indicating a posix command.
      #
      # Captures standard out and returns it as a string.
      # Cannot be run in the background.
      #
      # If a block is provided, a {Toys::Utils::Exec::Controller} will be
      # yielded to it.
      #
      # @param cmd [String,Array<String>] The command to execute.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [String] What was written to standard out.
      #
      def capture(cmd, **opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # Spawn a ruby process and pass the given arguments to it.
      #
      # Captures standard out and returns it as a string.
      # Cannot be run in the background.
      #
      # If a block is provided, a {Toys::Utils::Exec::Controller} will be
      # yielded to it.
      #
      # @param args [String,Array<String>] The arguments to ruby.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [String] What was written to standard out.
      #
      def capture_ruby(args, **opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # Execute a proc in a fork.
      #
      # Captures standard out and returns it as a string.
      # Cannot be run in the background.
      #
      # If a block is provided, a {Toys::Utils::Exec::Controller} will be
      # yielded to it.
      #
      # @param func [Proc] The proc to call.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [String] What was written to standard out.
      #
      def capture_proc(func, **opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # Execute the given string in a shell. Returns the exit code.
      # Cannot be run in the background.
      #
      # If a block is provided, a {Toys::Utils::Exec::Controller} will be
      # yielded to it.
      #
      # @param cmd [String] The shell command to execute.
      # @param opts [keywords] The command options. See the section on
      #     configuration options in the {Toys::Utils::Exec} class docs.
      # @yieldparam controller [Toys::Utils::Exec::Controller] A controller
      #     for the subprocess streams.
      #
      # @return [Integer] The exit code
      #
      def sh(cmd, **opts, &block)
        # Source available in the toys-core gem
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # An object that controls a subprocess. This object is returned from an
      # execution running in the background, or is yielded to a control block
      # for an execution running in the foreground.
      # You can use this object to interact with the subcommand's streams,
      # send signals to the process, and get its result.
      #
      class Controller
        ##
        # The subcommand's name.
        # @return [Object]
        #
        attr_reader :name

        ##
        # The subcommand's standard input stream (which can be written to).
        #
        # @return [IO] if the command was configured with `in: :controller`
        # @return [nil] if the command was not configured with
        #     `in: :controller`
        #
        attr_reader :in

        ##
        # The subcommand's standard output stream (which can be read from).
        #
        # @return [IO] if the command was configured with `out: :controller`
        # @return [nil] if the command was not configured with
        #     `out: :controller`
        #
        attr_reader :out

        ##
        # The subcommand's standard error stream (which can be read from).
        #
        # @return [IO] if the command was configured with `err: :controller`
        # @return [nil] if the command was not configured with
        #     `err: :controller`
        #
        attr_reader :err

        ##
        # The process ID.
        #
        # Exactly one of {#exception} and {#pid} will be non-nil.
        #
        # @return [Integer] if the process start was successful
        # @return [nil] if the process could not be started.
        #
        attr_reader :pid

        ##
        # The exception raised when the process failed to start.
        #
        # Exactly one of {#exception} and {#pid} will be non-nil.
        #
        # @return [Exception] if the process failed to start.
        # @return [nil] if the process start was successful.
        #
        attr_reader :exception

        ##
        # Captures the remaining data in the given stream.
        # After calling this, do not read directly from the stream.
        #
        # @param which [:out,:err] Which stream to capture
        # @return [self]
        #
        def capture(which)
          # Source available in the toys-core gem
        end

        ##
        # Captures the remaining data in the standard output stream.
        # After calling this, do not read directly from the stream.
        #
        # @return [self]
        #
        def capture_out
          # Source available in the toys-core gem
        end

        ##
        # Captures the remaining data in the standard error stream.
        # After calling this, do not read directly from the stream.
        #
        # @return [self]
        #
        def capture_err
          # Source available in the toys-core gem
        end

        ##
        # Redirects the remainder of the given stream.
        #
        # You can specify the stream as an IO or IO-like object, or as a file
        # specified by its path. If specifying a file, you can optionally
        # provide the mode and permissions for the call to `File#open`. You can
        # also specify the value `:null` to indicate the null file.
        #
        # After calling this, do not interact directly with the stream.
        #
        # @param which [:in,:out,:err] Which stream to redirect
        # @param io [IO,StringIO,String,:null] Where to redirect the stream
        # @param io_args [Object...] The mode and permissions for opening the
        #     file, if redirecting to/from a file.
        # @return [self]
        #
        def redirect(which, io, *io_args)
          # Source available in the toys-core gem
        end

        ##
        # Redirects the remainder of the standard input stream.
        #
        # You can specify the stream as an IO or IO-like object, or as a file
        # specified by its path. If specifying a file, you can optionally
        # provide the mode and permissions for the call to `File#open`. You can
        # also specify the value `:null` to indicate the null file.
        #
        # After calling this, do not interact directly with the stream.
        #
        # @param io [IO,StringIO,String,:null] Where to redirect the stream
        # @param io_args [Object...] The mode and permissions for opening the
        #     file, if redirecting from a file.
        # @return [self]
        #
        def redirect_in(io, *io_args)
          # Source available in the toys-core gem
        end

        ##
        # Redirects the remainder of the standard output stream.
        #
        # You can specify the stream as an IO or IO-like object, or as a file
        # specified by its path. If specifying a file, you can optionally
        # provide the mode and permissions for the call to `File#open`. You can
        # also specify the value `:null` to indicate the null file.
        #
        # After calling this, do not interact directly with the stream.
        #
        # @param io [IO,StringIO,String,:null] Where to redirect the stream
        # @param io_args [Object...] The mode and permissions for opening the
        #     file, if redirecting to a file.
        # @return [self]
        #
        def redirect_out(io, *io_args)
          # Source available in the toys-core gem
        end

        ##
        # Redirects the remainder of the standard error stream.
        #
        # You can specify the stream as an IO or IO-like object, or as a file
        # specified by its path. If specifying a file, you can optionally
        # provide the mode and permissions for the call to `File#open`.
        #
        # After calling this, do not interact directly with the stream.
        #
        # @param io [IO,StringIO,String] Where to redirect the stream
        # @param io_args [Object...] The mode and permissions for opening the
        #     file, if redirecting to a file.
        # @return [self]
        #
        def redirect_err(io, *io_args)
          # Source available in the toys-core gem
        end

        ##
        # Send the given signal to the process. The signal can be specified
        # by name or number.
        #
        # @param sig [Integer,String] The signal to send.
        # @return [self]
        #
        def kill(sig)
          # Source available in the toys-core gem
        end
        alias signal kill

        ##
        # Determine whether the subcommand is still executing
        #
        # @return [Boolean]
        #
        def executing?
          # Source available in the toys-core gem
        end

        ##
        # Wait for the subcommand to complete, and return a result object.
        #
        # Closes the control streams if present. The stdin stream is always
        # closed, even if the call times out. The stdout and stderr streams are
        # closed only after the command terminates.
        #
        # @param timeout [Numeric,nil] The timeout in seconds, or `nil` to
        #     wait indefinitely.
        # @return [Toys::Utils::Exec::Result] The result object
        # @return [nil] if a timeout occurred.
        #
        def result(timeout: nil)
          # Source available in the toys-core gem
        end
      end

      ##
      # **_Defined in the toys-core gem_**
      #
      # The result returned from a subcommand execution. This includes the
      # identifying name of the execution (if any), the result status of the
      # execution, and any captured stream output.
      #
      # Possible result statuses are:
      #
      #  *  The process failed to start. {Result#failed?} will return true, and
      #     {Result#exception} will return an exception describing the failure
      #     (often an errno).
      #  *  The process executed and exited with a normal exit code. Either
      #     {Result#success?} or {Result#error?} will return true, and
      #     {Result.exit_code} will return the numeric exit code.
      #  *  The process executed but was terminated by an uncaught signal.
      #     {Result#signaled?} will return true, and {Result#signal_code} will
      #     return the numeric signal code.
      #
      class Result
        ##
        # The subcommand's name.
        #
        # @return [Object]
        #
        attr_reader :name

        ##
        # The captured output string.
        #
        # @return [String] The string captured from stdout.
        # @return [nil] if the command was not configured to capture stdout.
        #
        attr_reader :captured_out

        ##
        # The captured error string.
        #
        # @return [String] The string captured from stderr.
        # @return [nil] if the command was not configured to capture stderr.
        #
        attr_reader :captured_err

        ##
        # The Ruby process status object, providing various information about
        # the ending state of the process.
        #
        # Exactly one of {#exception} and {#status} will be non-nil.
        #
        # @return [Process::Status] The status, if the process was successfully
        #     spanwed and terminated.
        # @return [nil] if the process could not be started.
        #
        attr_reader :status

        ##
        # The exception raised if a process couldn't be started.
        #
        # Exactly one of {#exception} and {#status} will be non-nil.
        # Exactly one of {#exception}, {#exit_code}, or {#signal_code} will be
        # non-nil.
        #
        # @return [Exception] The exception raised from process start.
        # @return [nil] if the process started successfully.
        #
        attr_reader :exception

        ##
        # The numeric status code for a process that exited normally,
        #
        # Exactly one of {#exception}, {#exit_code}, or {#signal_code} will be
        # non-nil.
        #
        # @return [Integer] the numeric status code, if the process started
        #     successfully and exited normally.
        # @return [nil] if the process did not start successfully, or was
        #     terminated by an uncaught signal.
        #
        def exit_code
          # Source available in the toys-core gem
        end

        ##
        # The numeric signal code that caused process termination.
        #
        # Exactly one of {#exception}, {#exit_code}, or {#signal_code} will be
        # non-nil.
        #
        # @return [Integer] The signal that caused the process to terminate.
        # @return [nil] if the process did not start successfully, or executed
        #     and exited with a normal exit code.
        #
        def signal_code
          # Source available in the toys-core gem
        end
        alias term_signal signal_code

        ##
        # Returns true if the subprocess failed to start, or false if the
        # process was able to execute.
        #
        # @return [Boolean]
        #
        def failed?
          # Source available in the toys-core gem
        end

        ##
        # Returns true if the subprocess terminated due to an unhandled signal,
        # or false if the process failed to start or exited normally.
        #
        # @return [Boolean]
        #
        def signaled?
          # Source available in the toys-core gem
        end

        ##
        # Returns true if the subprocess terminated with a zero status, or
        # false if the process failed to start, terminated due to a signal, or
        # returned a nonzero status.
        #
        # @return [Boolean]
        #
        def success?
          # Source available in the toys-core gem
        end

        ##
        # Returns true if the subprocess terminated with a nonzero status, or
        # false if the process failed to start, terminated due to a signal, or
        # returned a zero status.
        #
        # @return [Boolean]
        #
        def error?
          # Source available in the toys-core gem
        end
      end
    end
  end
end
