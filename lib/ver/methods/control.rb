module VER
  module Methods
    module Control
      def cursor_vertical_top
        insert_line = count('1.0', 'insert', :displaylines)
        last_line = count('1.0', 'end', :displaylines)
        fraction = ((100.0 / last_line) * insert_line) / 100
        yview_moveto(fraction)
      end

      def cursor_vertical_top_sol
        cursor_vertical_top
        start_of_line
      end

      def cursor_vertical_center
        insert_line = count('1.0', 'insert', :displaylines)
        last_line = count('1.0', 'end', :displaylines)
        shown_lines = count('@0,0', "@0,#{winfo_height}", :displaylines)
        fraction = ((100.0 / last_line) * (insert_line - (shown_lines / 2))) / 100
        yview_moveto(fraction)
      end

      def cursor_vertical_center_sol
        cursor_vertical_center
        start_of_line
      end

      def cursor_vertical_bottom
        insert_line = count('1.0', 'insert', :displaylines) + 1
        last_line = count('1.0', 'end', :displaylines)
        shown_lines = count('@0,0', "@0,#{winfo_height}", :displaylines)
        fraction = ((100.0 / last_line) * (insert_line - shown_lines)) / 100
        yview_moveto(fraction)
      end

      def cursor_vertical_bottom_sol
        cursor_vertical_bottom
        start_of_line
      end

      def chdir
        status_ask 'Change to: ' do |path|
          return unless File.directory?(path.to_s)
          Dir.chdir(path)
        end
      end

      # Toggle case of the character under the cursor up to +count+ characters
      # forward (+count+ is inclusive the first character).
      # This only works for alphabetic ASCII characters, no other encodings.
      def toggle_case(count = 1)
        from, to = 'insert', "insert + #{count} chars"
        chunk = get(from, to)
        chunk.tr!('a-zA-Z', 'A-Za-z')
        replace(from, to, chunk)
      end

      def repeat_command(count = 1)
        return unless command = keymap.last_send
        return if command.first == __method__
        count.times{ send(*command) }
        keymap.last_send = command
      end

      # Assigns env variables used in the given command.
      # - $f: The current buffer's filename
      # - $d: The current buffer's directory
      # - $F: A space-separated list of all buffer filenames
      # - $i: A string acquired from the user with a prompt
      # - $c: The current clipboard text
      # - $s: The currently selected text
      #
      # @param [String] command
      #   The string containing the command executed
      def prepare_exec(command)
        prepare_exec_f if command =~ /\$f/
        prepare_exec_d if command =~ /\$d/
        prepare_exec_F if command =~ /\$F/
        prepare_exec_i if command =~ /\$i/
        prepare_exec_c if command =~ /\$c/
        prepare_exec_s if command =~ /\$s/
      end

      def prepare_exec_f
        p f: (ENV['f'] = filename.to_s)
      end

      def prepare_exec_d
        p d: (ENV['d'] = filename.directory.to_s)
      end

      def prepare_exec_F
        p F: (ENV['F'] = layout.views.map{|v| v.text.filename }.join(' '))
      end

      def prepare_exec_i
        raise NotImplementedError
      end

      def prepare_exec_c
        p c: (ENV['c'] = clipboard_get)
      end

      def prepare_exec_s
        content = []

        each_selected_line do |y, fx, tx|
          content << get("#{y}.#{fx}", "#{y}.#{tx}")
        end

        ENV['s'] = content.join("\n")
      end

      def exec_into_new(command = nil)
        if command
          target = options.home_conf_dir/'shell-result.txt'
          prepare_exec(command)
          p command
          system(command)
          target.open('w+'){|io| io.write(`#{command}`) }
          view.find_or_create(target)
        else
          status_ask 'Command: ' do |command|
            exec_into_new(command)
          end
        end
      end

      def exec_into_void
        status_ask 'Command: ' do |command|
          system(command)
          message("Exit code: #{$?}")
        end
      end

      def tags_at(index = :insert)
        index = index(index)
        tags = tag_names(index)
        message tags.inspect

        require 'ver/tooltip'

        tooltip = Tk::Tooltip.new(tags.inspect)
        tooltip.show_on(self)

        Tk::After.ms(5000){ tooltip.destroy }
      end

      # Substitute over all lines of the buffer
      def gsub(regexp, with)
        total = 0
        index('1.0').upto(index('end')) do |index|
          lineend = index.lineend
          line = get(index, lineend)

          if line.gsub!(regexp, with)
            replace(index, lineend, line)
            total += 1
          end
        end

        message "Performed gsub on #{total} lines"
      end

      # Substitute on current line
      def sub(regexp, with)
        linestart = index('insert linestart')
        lineend = linestart.lineend
        line = get(linestart, lineend)

        if line.sub!(regexp, with)
          replace(linestart, lineend, line)
        end
      end

      def open_grep_list
        View::List::Grep.new self do |file, line|
          view.find_or_create(file, line)
        end
      end

      def grep_buffer
        View::List::Grep.new self, filename do |file, line|
          view.find_or_create(file, line)
        end
      end

      def grep_buffers
        glob = '{' << layout.views.map{|v| v.text.filename }.join(',') << '}'

        View::List::Grep.new self, glob do |file, line|
          view.find_or_create(file, line)
        end
      end

      def open_method_list
        View::List::Methods.new self do |file, line|
          view.find_or_create(file, line)
        end
      end

      class OpenPath
        class Entry < VER::Entry
          attr_accessor :keymap, :parent, :callback
          attr_reader :mode

          def initialize(parent, options = {})
            options[:style] ||= self.class.obtain_style_name
            super
            self.parent = parent

            keymap_name = VER.options.keymap
            self.keymap = Keymap.get(name: keymap_name, receiver: self)
          end

          def destroy
            style_name = style
            super
          ensure
            self.class.return_style_name(style_name)
          end

          def mode=(name)
            @keymap.mode = @mode = name.to_sym
          end

          def tree
            callback.tree
          end

          # keymap callbacks

          def completion
            callback.completion do |entry_value|
              values = yield(entry_value)
              tree.clear
              first = nil
              values.each do |value|
                item = tree.insert(nil, :end, text: value)
                first ||= item
              end

              return unless first

              first.focus
              first.selection_set
            end
          rescue => ex
            VER.error(ex)
          end

          def pick_selection
            callback.complete_or_pick do |value|
              parent.destroy if yield(value)
            end
          rescue => ex
            VER.error(ex)
          end

          def speed_selection
            completion
            pick_selection
            pick_selection
          end

          def cancel
            callback.destroy
          end

          def line_up
            children = tree.children(nil)

            return if children.size == 1

            item = tree.focus_item.prev

            if item.id == ''
              item = children.last
            end

            item.focus
            item.see
            item.selection_set
          end

          def line_down
            children = tree.children(nil)

            return if children.size == 1

            item = tree.focus_item.next

            if item.id == ''
              item = children.first
            end

            item.focus
            item.see
            item.selection_set
          end
        end

        class CompleteFile < OpenPath::Entry
          def completion
            super do |origin|
              Dir.glob("#{origin}*").map do |path|
                if File.directory?(path)
                  path = "#{path}/"
                end

                path
              end
            end
          end

          def pick_selection
            super do |path|
              callback.caller.view.find_or_create(path)
              true
            end
          end
        end

        class CompleteLabel < OpenPath::Entry
          COMPLETERS = {
            'edit'  => CompleteFile,
            'open'  => CompleteFile,
            'write' => CompleteFile,
          }

          def completion
            super do |name|
              COMPLETERS.keys.select{|key| key =~ /#{Regexp.escape(name)}/i }
            end
          end

          def pick_selection
            super do |name|
              entry = callback.use_entry(COMPLETERS.fetch(name))
              entry.focus
              false
            end
          end
        end

        attr_reader :caller, :tree

        def initialize(caller)
          @caller = caller
          @last_was_tab = false

          setup_widgets
          setup_tree
          setup_bindings

          @label.callback = self
          @label.mode = :open_path_entry
          @label.focus

          @active = @label
        end

        def setup_widgets
          @frame = Tk::Tile::Frame.new(VER.root)
          @label = CompleteLabel.new(@frame)
          @tree  = Tk::Tile::Treeview.new(@frame)

          @frame.place(anchor: :n, relx: 0.5, relwidth: 0.8)

          @label.grid_configure(row: 0 ,column: 0, sticky: :w)
          @tree. grid_configure(row: 1, column: 0, columnspan: 2, sticky: :nswe)
          @tree. grid_forget

          @frame.grid_rowconfigure(0, weight: 1)
          @frame.grid_rowconfigure(1, weight: 2)
          @frame.grid_columnconfigure(0, weight: 0)
          @frame.grid_columnconfigure(1, weight: 2)
        end

        def use_entry(klass)
          @entry = klass.new(@frame)
          @entry.grid_configure(row: 0, column: 1, sticky: :we)
          @entry.callback = self
          @entry.mode = :open_path_entry
          @active = @entry
          setup_bindings
          @entry
        end

        def setup_tree
          @tree.heading '#0', text: 'Path'
        end

        def setup_bindings
          [@entry, @label].compact.each do |widget|
            widget.bind('<<Deleted>>') do
              @last_was_tab = false
            end

            widget.bind('<<Inserted>>') do
              @last_was_tab = false
            end
          end
        end

        def destroy
          @label.destroy
          @entry.destroy
          @tree.destroy
          @frame.destroy
          @caller.focus
        end

        def completion
          @tree.grid_configure(row: 1, column: 0, columnspan: 2, sticky: :nswe)

          if @last_was_tab
            # Make sure that we don't automatically venture deeper if there are
            # multiple choices.
            # We simply go down the list of choices and update the entry value.
            # If there was only one choice, we go deeper once.
            children = @tree.children(nil)

            if children.size == 1
              item = children.first
              @active.value = value = item.options(:text).to_s
              yield(value)
            else
              item = @tree.focus_item.next

              if item.id == ''
                item = @tree.children(nil).first
              end

              item.focus
              item.see
              item.selection_set
            end
          else
            # seems the user did input something since last time, build a new
            # list.
            yield(@active.value)
          end

          @last_was_tab = true
        rescue => ex
          VER.error(ex)
        end

        def complete_or_pick
          if @last_was_tab
            # the user might want to complete with the current focused one
            item = @tree.focus_item
            text = item.options(:text).to_s
            @active.value = text
          else
            # the user accepts the input?
            yield(@active.value)
          end

          @last_was_tab = false
        rescue => ex
          VER.error(ex)
        end
      end

      # :open <Tab> # => '', '*'
      # :open l<Tab> # => 'lib/', 'lib/*'
      # :open lib/v<Tab> # => 'lib/ver', 'lib/ver*'
      # :open lib/ver<Tab> # => 'lib/ver/', 'lib/ver*'
      # :open lib/ver/<Tab> # => 'lib/ver.rb', 'lib/ver*'
      def status_open
        return OpenPath.new(self)
      end

      # TODO: make this better?
      def status_ex
        completion = method(:status_ex_filter)

        View::List::Ex.new self, completion do |command, propose|
          begin
            result = propose ? send(command, propose) : eval(command)
            status.message "%s # => %p" % [command, result]
          rescue Exception => ex
            status.error "%s # => %p" % [command, ex]
          end
        end
      end

      def status_ex_filter(input)
        input = input.to_s.split.last
        return [] if !input || input.empty?

        begin
          regexp = Regexp.new(input)
        rescue ArgumentError, RegexpError, SyntaxError
          regexp = Regexp.new(Regexp.escape(input))
        end

        self.methods.grep(regexp).sort_by{|sym| sym =~ regexp }
      end

      def open_console
        View::Console.new(self)
      end

      def open_terminal
        require 'ver/view/term'
        View::Terminal.new(self)
      end

      def wrap_line
        text = get('insert linestart', 'insert lineend')
        textwidth = options[:textwidth]
        lines = wrap_lines_of(text, textwidth).join("\n")
        lines.rstrip!

        replace('insert linestart', 'insert lineend', lines)
      end

      def status_theme_select
        return unless @syntax

        status_ask 'Theme name: ' do |name|
          load_theme(name) || "No theme called #{name} found"
        end
      end

      def theme_switch
        return unless @syntax

        View::List::Theme.new(self){|name| load_theme(name) }
      end

      def syntax_switch
        return unless @syntax

        View::List::Syntax.new(self){|name| load_syntax(name) }
      end

      def status_evaluate
        status_ask 'Eval expression: ' do |term|
          begin
            eval(term)
          rescue Exception => ex
            ex
          end
        end
      end

      def smart_evaluate
        if sel = tag_ranges(:sel)
          from, to = sel.first
          return selection_evaluate if from && to
        end

        line_evaluate
      end

      def line_evaluate
        text = get('insert linestart', 'insert lineend')
        stdout_capture_evaluate(text) do |res,out|
          insert("insert lineend", "\n%s%p" % [out, res] )
        end
      end

      def stdout_capture_evaluate(code)
        begin
          old_stdout = $stdout.dup
          rd, wr = IO.pipe
          $stdout.reopen(wr)
          result = eval(code)
          $stdout.reopen old_stdout; wr.close
          stdout = rd.read

          yield(result, stdout)
        rescue Exception => exception
          yield(exception, '')
        ensure
          wr.closed? || $stdout.reopen(old_stdout) && wr.close
          rd.closed? || rd.close
        end
      end

      def eval_buffer
        result = eval(value, TOPLEVEL_BINDING)
      rescue Exception => exception
        VER.error(exception)
      end

      def buffer_switch
        View::List::Buffer.new self do |file|
          view.find_or_create(file) if File.exists?(file)
        end
      end

      def window_switch(count = nil)
        if count
          # p count: count
        else
          View::List::Window.new self do |view|
            view.push_top
            view.focus
          end
        end
      end

      def file_open_popup
        filetypes = [
          ['ALL Files',  '*'    ],
          ['Text Files', '*.txt'],
        ]

        fpath = Tk.get_open_file(filetypes: filetypes)

        return unless fpath

        view.find_or_create(fpath)
      end

      def file_open_fuzzy
        View::List::FuzzyFileFinder.new self do |path|
          view.find_or_create(path)
        end
      end

      def join_lines
        start_of_next_line = search(/\S/, 'insert lineend').first
        replace('insert lineend', start_of_next_line, ' ')
      rescue RuntimeError => exception
        return if exception.message =~ /Index "\d+\.\d+" before "insert lineend" in the text/
        Kernel.raise exception
      end

      def replace_char
        status_ask 'Replace with: ', take: 1 do |char|
          if char.size == 1
            replace('insert', 'insert + 1 chars', char)
            backward_char
            "replaced #{char.size} chars"
          else
            status.message 'replace aborted'
          end
        end
      end

      def indent_line(count = 1)
        indent = (' ' * options[:shiftwidth] * count)
        insert('insert linestart', indent)
      end

      def unindent_line(count = 1)
        indent = ' ' * options[:shiftwidth]
        replace_from = 'insert linestart'
        replace_to = "insert linestart + #{indent.size} chars"

        undo_record do |record|
          count.times do
            line = get('insert linestart', 'insert lineend')

            return unless line.start_with?(indent)

            record.replace(replace_from, replace_to, '')
          end
        end
      end

      def clean_line(index, record = self)
        index = index(index)
        from, to = index.linestart, index.lineend
        line = get(from, to)
        bare = line.rstrip
        record.replace(from, to, bare) if bare.empty?
      end

      def start_insert_mode
        self.mode = :insert
      end

      def start_control_mode
        clean_line(:insert)
        self.mode = :control
      end

      private

      def wrap_lines_of(text, wrap = 80)
        Kernel.raise ArgumentError, "+wrap+ must be > 1" unless wrap > 1
        wrap -= 1

        indent = text[/^\s+/] || ''
        indent_size = indent.size
        lines = [indent.dup]

        text.scan(/\S+/) do |chunk|
          last = lines.last
          last_size = last.size
          chunk_size = chunk.size

          if last_size + chunk_size > wrap
            lines << indent + chunk
          elsif last_size == indent_size
            last << chunk
          elsif chunk =~ /\.$/
            last << ' ' << chunk
            lines << indent.dup
          else
            last << ' ' << chunk
          end
        end

        lines
      end

      def status_ask(prompt, options = {}, &callback)
        @status.ask(prompt, options){|*args|
          begin
            callback.call(*args)
          rescue => ex
            VER.error(ex)
          ensure
            begin
              focus
            rescue RuntimeError
              # might have been destroyed, stay silent
            end
          end
        }
      end
    end
  end
end
