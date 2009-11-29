module VER
  class Keymap
    def self.vim(options)
      vim = new(options)
      vim.mode = options.fetch(:mode, :control)

      vim.add_mode :basic do |mode|
        mode.map :file_open_popup,    %w[Control-o]
        mode.map :file_open_fuzzy,    %w[Alt-o], %w[Control-m o]
        mode.map :status_evaluate,    %w[Alt-x], %w[Control-m x]
        mode.map :file_save,          %w[Control-s]
        mode.map :file_save_popup,    %w[Control-Alt-s]
        mode.map :quit,               %w[Control-q]
        mode.map :start_control_mode, %w[Escape], %w[Control-c]
        mode.map :open_method_list,   %w[F10]
        mode.map :open_terminal,      %w[F9]
        mode.map :open_grep_list,     %w[Alt-g], %w[Control-m g]
        mode.map :describe_key,       %w[Control-h k]
        mode.map :help_for_help,      %w[Control-h question], %w[F1], %w[Help]
        mode.map :tags_at,            %w[Control-g t]

        mode.map :buffer_switch, %w[Alt-b], %w[Control-m b]
        mode.map :window_switch, %w[Alt-B], %w[Control-m B]
        mode.map :open_console,  %w[Control-exclam]
      end

      vim.add_mode :views do |mode|
        mode.map :view_one,         %w[Control-w KeyPress-1]
        mode.map :view_two,         %w[Control-w KeyPress-2]

        mode.map :view_slave_inc,   %w[Control-w plus]
        mode.map :view_slave_dec,   %w[Control-w minus]

        mode.map :view_master_inc,  %w[Control-w H]
        mode.map :view_master_dec,  %w[Control-w L]

        mode.map :view_create,      %w[Control-w c]
        mode.map :view_focus_next,  %w[Control-w j]
        mode.map :view_focus_prev,  %w[Control-w k]
        mode.map :view_push_down,   %w[Control-w J]
        mode.map :view_push_up,     %w[Control-w K]
        mode.map :view_close,       %w[Control-w w]
        mode.map :view_push_top,    %w[Control-w Return]
        mode.map :view_push_bottom, %w[Control-w BackSpace]
      end

      vim.add_mode :move do |mode|
        mode.map :beginning_of_line,      %w[KeyPress-0], %w[Home]
        mode.map :backward_char,          %w[h], %w[Left]
        mode.map :forward_char,           %w[l], %w[Right]
        mode.map :end_of_file,            %w[G]
        mode.map :end_of_line,            %w[dollar], %w[End]
        mode.map :go_line,                %w[g g]
        mode.map :next_line,              %w[j], %w[Down], %w[Control-n]
        mode.map :previous_line,          %w[k], %w[Up], %w[Control-p]
        mode.map :next_newline_block,     %w[braceleft]
        mode.map :page_down,              %w[Control-f], %w[Next]
        mode.map :page_up,                %w[Control-b], %w[Prior]
        mode.map :prev_newline_block,     %w[braceright]
        mode.map :backward_word,          %w[b], %w[Shift-Left]
        mode.map :forward_word,           %w[w], %w[Shift-Right]
        mode.map :word_right_end,         %w[e]
        mode.map :matching_brace,         %w[percent]
      end

      vim.add_mode :search do |mode|
        mode.map :search_next,                   %w[n]
        mode.map :search_next_word_under_cursor, %w[asterisk]
        mode.map :search_prev,                   %w[N]
        mode.map :search_prev_word_under_cursor, %w[numbersign]
        mode.map :status_search_next,            %w[slash]
        mode.map :status_search_prev,            %w[question]
        mode.map :search_char_right,             %w[f]
        mode.map :search_char_left,              %w[F]
      end

      vim.add_mode :ctags do |mode|
        mode.map :ctags_find_current, %w[Control-bracketright] # C-]
      end

      vim.add_mode :complete do |mode|
        mode.arguments = false

        mode.to :complete_file,   %w[Control-x Control-f]
        mode.to :complete_line,   %w[Control-x Control-l]
        mode.to :complete_word,   %w[Control-x Control-w]
        mode.to :complete_aspell, %w[Control-x Control-a]
        mode.to :complete_tm,     %w[Control-x Control-x]
        mode.to :smart_tab,       %w[Tab]
      end

      vim.add_mode :control do |mode|
        mode.inherits :basic, :move, :views, :search, :ctags

        mode.map :copy_left_word,                  %w[y b]
        mode.map :copy_line,                       %w[y y], %w[Y]
        mode.map :copy_right_word,                 %w[y w]
        mode.map :kill_line,                       %w[d d]
        mode.map :change_line,                     %w[c c]
        mode.map [:kill_motion, :backward_char],   %w[X]
        mode.map [:kill_motion, :forward_char],    %w[x]
        mode.map [:kill_motion, :end_of_line],     %w[D]
        mode.map [:change_motion, :end_of_line],   %w[C]

        mode.map :change_motion,                   ['c', :move]
        mode.map :kill_motion,                     ['d', :move]

        mode.map :eol_then_insert_mode,            %w[A]
        mode.map :forward_char_then_insert_mode,   %w[a]

        mode.map :indent_line,                     %w[greater]
        mode.map :insert_indented_newline_above,   %w[O]
        mode.map :insert_indented_newline_below,   %w[o]
        mode.map :join_lines,                      %w[J]
        mode.map :paste,                           %w[p]
        mode.map :redo,                            %w[Control-r]
        mode.map :replace_char,                    %w[r]
        mode.map :smart_evaluate,                  %w[Alt-e], %w[Control-m e]
        mode.map :sol_then_insert_mode,            %w[I]
        mode.map :start_insert_mode,               %w[i]
        mode.map :start_replace_mode,              %w[R]
        mode.map :start_select_block_mode,         %w[Control-v]
        mode.map :start_select_char_mode,          %w[v]
        mode.map :start_select_line_mode,          %w[V]
        mode.map :status_theme_select,             %w[Alt-t], %w[Control-m t]
        mode.map :syntax_switch,                   %w[Control-y]
        mode.map :theme_switch,                    %w[Control-t]
        mode.map :undo,                            %w[u]
        mode.map :unindent_line,                   %w[less]
        mode.map :wrap_line,                       %w[g w]
        mode.map :preview,                         %w[F5]
        mode.map :status_ex,                       %w[colon]
        mode.map :syntax_indent_file,              %w[equal]
      end

      vim.add_mode :replace do |mode|
        mode.inherits :basic
      end

      vim.add_mode :readline do |mode|
        mode.arguments = false

        mode.map [:kill_motion, :backward_char],   %w[BackSpace]
        mode.map [:kill_motion, :forward_char],    %w[Delete], %w[Control-d]
        mode.map [:kill_motion, :backward_word],   %w[Control-w]
        mode.map :backward_char,                   %w[Left], %w[Control-b]
        mode.map :forward_char,                    %w[Right], %w[Control-f]
        mode.map :backward_word,                   %w[Shift-Left], %w[Alt-b]
        mode.map :forward_word,                    %w[Shift-Right], %w[Alt-f]
        mode.map :beginning_of_line,               %w[Home], %w[Control-a]
        mode.map :end_of_line,                     %w[End], %w[Control-e]
        mode.map :insert_selection,                %w[Shift-Insert]
        mode.map :accept_line,                     %w[Return]
        mode.map :previous_history,                %w[Up], %w[Control-p]
        mode.map :next_history,                    %w[Down], %w[Control-n]
        mode.map :beginning_of_history,            %w[Control-less]
        mode.map :end_of_history,                  %w[Control-greater]
        mode.map :transpose_chars,                 %w[Control-t]
        mode.map :insert_tab,                      %w[Control-v Tab]

        KEYSYMS.each do |sym, name|
          mode.map [:insert_string, sym], [name]
        end
      end

      vim.add_mode :insert do |mode|
        mode.inherits :basic, :views, :complete, :readline
        mode.arguments = false

        mode.map :next_line,               %w[Down], %w[Control-n]
        mode.map :previous_line,           %w[Up], %w[Control-p]
        mode.map :page_down,               %w[Control-f], %w[Next], %w[Shift-Down]
        mode.map :page_up,                 %w[Control-b], %w[Prior], %w[Shift-Up]
        mode.map :insert_indented_newline, %w[Return]
        mode.map :smart_evaluate,          %w[Alt-e], %w[Control-e]

        mode.missing :insert_string
      end

      vim.add_mode :select do |mode|
        mode.inherits :basic, :move, :search

        mode.map :copy_selection,               %w[y], %w[Y]
        mode.map :kill_selection,               %w[d], %w[D], %w[x], %w[BackSpace], %w[Delete]
        mode.map :indent_selection,             %w[greater]
        mode.map :pipe_selection,               %w[exclam]
        mode.map :smart_evaluate,               %w[Alt-e], %w[Control-e]
        mode.map :switch_select_block_mode,     %w[Control-v]
        mode.map :switch_select_char_mode,      %w[v]
        mode.map :switch_select_line_mode,      %w[V]
        mode.map :unindent_selection,           %w[less]
        mode.map :comment_selection,            %w[comma c]
        mode.map :uncomment_selection,          %w[comma u]
        mode.map :wrap_selection,               %w[g w]
        mode.map :selection_replace_char,       %w[r]
        mode.map :selection_replace_string,     %w[c]
        mode.map [:finish_selection, :control], %w[Escape], %w[Control-c]
      end

      vim.add_mode :select_char do |mode|
        mode.inherits :select
      end

      vim.add_mode :select_line do |mode|
        mode.inherits :select
      end

      vim.add_mode :select_block do |mode|
        mode.inherits :select
      end

      vim.add_mode :status_query do |mode|
        mode.inherits :basic, :readline
        mode.arguments = false

        mode.to :ask_abort,  %w[Escape], %w[Control-c]
        mode.to :history_prev, %w[Up], %w[Control-p]
        mode.to :history_next, %w[Down], %w[Control-n]
        mode.to :history_complete, %w[Tab]
        mode.to :ask_submit, %w[Return]

        mode.missing :insert_string
      end

      vim.add_mode :list_view_entry do |mode|
        mode.inherits :basic, :readline
        mode.arguments = false

        # mode.to :update, %w[Key]
        mode.to :pick_selection, %w[Return]
        mode.to :cancel,         %w[Escape], %w[Control-c]
        mode.to :line_up,        %w[Up]
        mode.to :line_down,      %w[Down]
        mode.to :completion,     %w[Tab]

        mode.missing :insert_string
      end

      vim.add_mode :list_view_list do |mode|
        mode.inherits :basic

        mode.to :pick_selection, %w[Return], %w[Double-Button-1]
        mode.to :line_up,        %w[Up]
        mode.to :line_down,      %w[Down]
      end

      vim.add_mode :hover_completion do |mode|
        mode.inherits :basic

        mode.to :go_up,               %w[Up], %w[k]
        mode.to :go_down,             %w[Down], %w[j]
        mode.to :continue_completion, %w[Right], %w[l]
        mode.to :submit,              %w[Return]
        mode.to :cancel,              %w[Escape], %w[BackSpace]
      end

      vim
    end
  end
end

__END__
      vim.add_mode :console_entry do |mode|
        mode.inherits :basic, :readline
        mode.arguments = false

#        mode.to :execute,      %w[Return]
#        mode.to :cancel,       %w[Escape], %w[Control-c]
#        mode.to :history_up,   %w[Up]
#        mode.to :history_down, %w[Down]

         mode.to :vi_eof_maybe,           %w[Control-d]
         mode.to :emacs_editing_mode,     %w[Control-e]
         mode.to :abort,                  %w[Control-g]
         mode.to :backward_char,          %w[Control-h]
         mode.to :accept_line,            %w[Control-j], %w[Control-m]
         mode.to :kill_line,              %w[Control-k]
         mode.to :clear_screen,           %w[Control-l]
         mode.to :next_history,           %w[Control-n]
         mode.to :previous_history,       %w[Control-p], %w[minus]
         mode.to :quoted_insert,          %w[Control-o], %w[Control-V]
         mode.to :reverse_search_history, %w[Control-r]
         mode.to :forward_search_history, %w[Control-s]
         mode.to :transpose_chars,        %w[Control-t]
         mode.to :unix_line_discard,      %w[Control-u]
         mode.to :unix_word_rubout,       %w[Control-w]
         mode.to :yank,                   %w[Control-y]
         mode.to :vi_undo,                %w[Control-underscore]
         mode.to :forwad_char,            %w[space]
         mode.to :insert_comment,         %w[numbersign]
         mode.to :end_of_line,            %w[dollar]
         mode.to :vi_match,               %w[percent]
         mode.to :vi_tilde_expand,        %w[ampersand]
         mode.to :vi_complete,            %w[asterisk]
         mode.to :next_history,           %w[plus]
         mode.to :vi_char_search,         %w[comma]
         mode.to :vi_redo,                %w[period]
         mode.to :vi_search,              %w[numbersign]
         mode.to :beginning_of_line,      %w[KeyPress-0]
         mode.to :vi_char_search,         %w[semicolon]
         mode.to :vi_complete,            %w[equal]
         mode.to :vi_search,              %w[question]
         mode.to :vi_append_eol,          %w[A]
         mode.to :vi_prev_word,           %w[B]
         mode.to :vi_change_to,           %w[C]
         mode.to :vi_delete_to,           %w[D]
         mode.to :vi_end_word,            %w[E]
         mode.to :vi_char_search,         %w[F]
         mode.to :vi_fetch_history,       %w[G]
         mode.to :vi_insert_beg,          %w[I]
         mode.to :vi_search_again,        %w[N]
         mode.to :vi_put,                 %w[P]
         mode.to :vi_replace,             %w[R]
         mode.to :vi_subst,               %w[S]
         mode.to :vi_char_search,         %w[T]
         mode.to :revert_line,            %w[U]
         mode.to :vi_next_word,           %w[W]
         mode.to :backward_delete_char,   %w[X]
         mode.to :vi_yank_to,             %w[Y]
         mode.to :vi_complete,            %w[backslash]
         mode.to :vi_first_print,         %w[asciicircum]
         mode.to :vi_yank_arg,            %w[underscore]
         mode.to :vi_goto_mark,           %w[quoteleft]
         mode.to :vi_append_mode,         %w[a]
         mode.to :vi_prev_word,           %w[b]
         mode.to :vi_change_to,           %w[c]
         mode.to :vi_delete_to,           %w[d]
         mode.to :vi_end_word,            %w[e]
         mode.to :vi_char_search,         %w[f]
         mode.to :backward_char,          %w[h]
         mode.to :vi_insertion_mode,      %w[i]
         mode.to :next_history,           %w[j]
         mode.to :prev_history,           %w[k]
         mode.to :forward_char,           %w[l]
         mode.to :forward_char,           %w[l]
         mode.to :vi_set_mark,            %w[m]
         mode.to :vi_search_again,        %w[n]
         mode.to :vi_put,                 %w[p]
         mode.to :vi_change_char,         %w[r]
         mode.to :vi_subst,               %w[s]
         mode.to :vi_char_search,         %w[t]
         mode.to :vi_undo,                %w[u]
         mode.to :vi_next_word,           %w[w]
         mode.to :vi_delete,              %w[x]
         mode.to :vi_yank_to,             %w[y]
         mode.to :vi_column,              %w[bar]
         mode.to :vi_change_case,         %w[asciitilde]

        mode.missing :insert_string
      end
