module VER
  minor_mode :help do
    handler VER::Methods::Help

    map :describe_key, %w[Control-h k]
  end

  minor_mode :open do
    handler VER::Methods::Open

    map :file_open_popup, %w[Control-o]
    map :file_open_fuzzy, %w[Alt-o], %w[Control-m o]
  end

  minor_mode :save do
    handler VER::Methods::Save

    map :file_save,       %w[Control-s]
    map :file_save_popup, %w[Control-Alt-s]
  end

  minor_mode :preview do
    handler VER::Methods::Preview

    map :preview, %w[F5]
  end

  minor_mode :basic do
    inherits :help, :preview, :save, :open
    handler VER::Methods::Basic

    become :control,          %w[Escape], %w[Control-c]

    map :quit,                %w[Control-q]
    map :source_buffer,       %w[Control-R]
    map :status_evaluate,     %w[Alt-x], %w[Control-m x]
    map :tags_at,             %w[Control-g t]

    map :open_terminal,       %w[F9]
    map :open_console,        %w[Control-exclam] if defined?(::EM)

    # to be deprecated
    map :open_buffer_switch,  %w[Alt-b], %w[Control-m b]
    map :open_grep_buffer,    %w[Alt-g], %w[Control-m g]
    map :open_grep_buffers,   %w[Alt-G], %w[Control-m G]
    map :open_grep_list,      %w[Control-Alt-g], %w[Control-m Control-g]
    map :open_method_list,    %w[F10]
    map :open_window_switch,  %w[Alt-B], %w[Control-m B]
  end

  minor_mode :views do
    inherits :basic
    handler VER::Methods::Views
    # handler VER::Methods::Views

    map :one,           %w[1]
    map :two,           %w[2]

    map :slave_inc,     %w[plus]
    map :slave_dec,     %w[minus]

    map :master_inc,    %w[H]
    map :master_dec,    %w[L]

    map :create,        %w[c]
    map :focus_next,    %w[j], %w[Right]
    map :focus_prev,    %w[k], %w[Left]
    map :push_down,     %w[J], %w[Down]
    map :push_up,       %w[K], %w[Up]
    map :close,         %w[w]
    map :push_top,      %w[Return]
    map :push_bottom,   %w[BackSpace]

    map :master_shrink, %w[h]
    map :master_grow,   %w[l]

    map :peer,          %w[p]
  end

  minor_mode :views_control do
    handler VER::Methods::Views
    become :views, %w[Control-w r]

    map :change,     ['Control-w', :views]
    map :focus_next, %w[Control-Tab]
    map :focus_prev, %w[Control-Shift-Tab], %w[Control-ISO_Left_Tab]
    map :cycle_next, %w[Alt-Tab]
    map :cycle_prev, %w[Alt-Shift-Tab], %w[Alt-ISO_Left_Tab]
  end

  minor_mode :move do
    handler VER::Methods::Move

    map :prev_char,       %w[h], %w[Left]
    map :prev_chunk,      %w[B]
    map :prev_word,       %w[b], %w[Shift-Left]
    map :start_of_line,   %w[0], %w[Home]
    map :end_of_file,     %w[G]
    map :end_of_line,     %w[dollar], %w[End]
    map :next_char,       %w[l], %w[Right]
    map :next_chunk,      %w[W]
    map :next_word,       %w[w], %w[Shift-Right]
    map :go_line,         %w[g g]
    map :matching_brace,  %w[percent]
    map :next_line,       %w[j], %w[Down], %w[Control-n]
    map :next_page,       %w[Control-f], %w[Next]
    map :prev_page,       %w[Control-b], %w[Prior]
    map :prev_line,       %w[k], %w[Up], %w[Control-p]
    map :next_word_end,   %w[e]
  end

  minor_mode :search do
    handler VER::Methods::Search

    map :search_char_left,               %w[F]
    map :search_char_right,              %w[f]
    map :search_next,                    %w[n]
    map :search_next_word_under_cursor,  %w[asterisk]
    map :search_prev,                    %w[N]
    map :search_prev_word_under_cursor,  %w[numbersign]
    map :search_remove,                  %w[g slash]
    map :status_search_next,             %w[slash]
    map :status_search_prev,             %w[question]
  end

  minor_mode :ctags do
    handler VER::Methods::CTags

    map :find_current,  %w[Control-bracketright] # C-]
    map :prev,          %w[Control-bracketleft]  # C-[
  end

  minor_mode :bookmark do
    handler VER::Methods::Bookmark

    map :add_char,    %w[m]
    map :visit_char,  %w[quoteleft]
    # vim also has quoteright to jump to the start of the line, but who
    # needs that *_*
  end

  minor_mode :complete do
    handler VER::Methods::Completion

    map :aspell,     %w[Control-x Control-a]
    map :contextual, %w[Control-x Control-x]
    map :file,       %w[Control-x Control-f]
    map :line,       %w[Control-x Control-l]
    map :snippet,    %w[Control-x Control-s]
    map :word,       %w[Control-x Control-w]
    map :smart_tab,  %w[Tab]
  end

  minor_mode :delete do
    handler VER::Methods::Delete

    map :change_line,                    %w[c c]
    map :kill_line,                      %w[d d]
    map :kill_motion,                    ['d', :move]
    map :change_motion,                  ['c', :move]
    map [:change_motion, :end_of_line],  %w[C]
    map [:change_word_right_end],        %w[c w]
    map [:kill_motion, :prev_char],  %w[X]
    map [:kill_motion, :end_of_line],    %w[D]
    map [:kill_motion, :next_char],   %w[x]
  end

  minor_mode :clipboard do
    handler VER::Methods::Clipboard

    map :copy_line,        %w[y y], %w[Y]
    map :copy_motion,      ['y', :move]
    map :paste,            %w[p]
    map :paste_above,      %w[P]
  end

  minor_mode :undo do
    handler VER::Methods::Undo

    map :redo, %w[Control-r]
    map :undo, %w[u]
  end

  minor_mode :control do
    inherits :basic, :move, :delete, :undo, :views_control, :search, :ctags,
             :bookmark, :clipboard
    handler VER::Methods::Control

    become :select_block,   %w[Control-v]
    become :select_char,    %w[v]
    become :select_line,    %w[V]
    become :insert,         %w[i]
    become :replace,        %w[R]

    map :chdir,                             %w[g c]

    map :cursor_vertical_bottom,            %w[z b]
    map :cursor_vertical_bottom_sol,        %w[z minus]
    map :cursor_vertical_center,            %w[z z]
    map :cursor_vertical_center_sol,        %w[z period]
    map :cursor_vertical_top,               %w[z t]
    map :cursor_vertical_top_sol,           %w[z Return]

    map [:insert_at, :end_of_line],         %w[A]
    map [:insert_at, :next_char],           %w[a]

    map :indent_line,                       %w[greater]

    map :insert_indented_newline_above,     %w[O]
    map :insert_indented_newline_below,     %w[o]

    map :join_lines,                        %w[J]

    map :open_file_under_cursor,            %w[g f]

    map :repeat_command,                    %w[period]
    map :replace_char,                      %w[r]
    map :smart_evaluate,                    %w[Alt-e], %w[Control-m e]

    map [:insert_at, :home_of_line],        %w[I]

    map :executor,                          %w[colon]
    map :syntax_switch,                     %w[Control-y]
    map :theme_switch,                      %w[Control-t]
    map :toggle_case,                       %w[asciitilde]

    map :unindent_line,                     %w[less]
    map :wrap_line,                         %w[g w]
  end

  minor_mode :readline do
    map :accept_line,                %w[Return]

    map :end_of_line,                %w[End], %w[Control-e]
    map :insert_selection,           %w[Shift-Insert]
    map :insert_tab,                 %w[Control-v Tab]
    map :next_char,                  %w[Right], %w[Control-f]
    map :next_word,                  %w[Shift-Right], %w[Alt-f]
    map :prev_char,                  %w[Left], %w[Control-b]
    map :prev_word,                  %w[Shift-Left], %w[Alt-b]
    map :start_of_line,              %w[Home], %w[Control-a]
    map :transpose_chars,            %w[Control-t]

    map [:kill_motion, :next_char],  %w[Delete], %w[Control-d]
    map [:kill_motion, :prev_char],  %w[BackSpace]
    map [:kill_motion, :prev_word],  %w[Control-w]

    # map :beginning_of_history,       %w[Control-less]
    # map :end_of_history,             %w[Control-greater]
    # map :next_history,               %w[Down], %w[Control-n]
    # map :prev_history,               %w[Up], %w[Control-p]

    missing :insert_string
  end

  minor_mode :insert do
    inherits :basic, :views_control, :complete

    handler VER::Methods::Insert
    map :insert_indented_newline,  %w[Return]
    map :insert_selection,           %w[Shift-Insert]
    map :insert_tab,                 %w[Control-v Tab]
    missing :insert_string

    handler VER::Methods::Delete
    map [:kill_motion, :next_char],  %w[Delete], %w[Control-d]
    map [:kill_motion, :prev_char],  %w[BackSpace]
    map [:kill_motion, :prev_word],  %w[Control-w]

    handler VER::Methods::Move
    map :next_line,      %w[Down], %w[Control-n]
    map :next_page,      %w[Control-f], %w[Next], %w[Shift-Down]
    map :prev_page,      %w[Control-b], %w[Prior], %w[Shift-Up]
    map :prev_line,      %w[Up], %w[Control-p]
    map :end_of_line,    %w[End], %w[Control-e]
    map :next_char,      %w[Right], %w[Control-f]
    map :next_word,      %w[Shift-Right], %w[Alt-f]
    map :prev_char,      %w[Left], %w[Control-b]
    map :prev_word,      %w[Shift-Left], %w[Alt-b]
    map :start_of_line,  %w[Home], %w[Control-a]

    handler VER::Methods::Control
    map :smart_evaluate,           %w[Alt-e], %w[Control-e]

    handler VER::Methods::AutoFill
    map :auto_fill_space,          %w[space]
  end

  minor_mode :replace do
    inherits :insert
    handler VER::Methods::Insert

    missing :replace_string
  end

  minor_mode :select do
    inherits :basic, :move, :search
    handler VER::Methods::Selection

    become :select_block,  %w[Control-v]
    become :select_char,   %w[v]
    become :select_line,   %w[V]
    become :control,       %w[Escape], %w[Control-c]

    map :comment,         %w[comma c]
    map :copy,            %w[y], %w[Y]
    map :indent,          %w[greater]
    map :kill,            %w[d], %w[D], %w[x], %w[BackSpace], %w[Delete]
    map :pipe,            %w[exclam]
    map :lower_case,      %w[u]
    map :replace_char,    %w[r]
    map :replace_string,  %w[c]
    map :toggle_case,     %w[asciitilde]
    map :upper_case,      %w[U]
    map :uncomment,       %w[comma u]
    map :unindent,        %w[less]
    map :wrap,            %w[g w]

    handler VER::Methods::Control
    map :smart_evaluate,  %w[Alt-e], %w[Control-e]
  end

  minor_mode :select_char do
    inherits :select
    enter{|event| VER::Methods::Selection.enter(event) }
    leave{|event| VER::Methods::Selection.leave(event) }
  end

  minor_mode :select_line do
    inherits :select
    enter{|event| VER::Methods::Selection.enter(event) }
    leave{|event| VER::Methods::Selection.leave(event) }
  end

  minor_mode :select_block do
    inherits :select
    enter{|event| VER::Methods::Selection.enter(event) }
    leave{|event| VER::Methods::Selection.leave(event) }
  end

  minor_mode :status_query do
    inherits :basic, :readline

    map :ask_abort,         %w[Escape], %w[Control-c]
    map :ask_submit,        %w[Return]

    # map :history_complete,  %w[Tab]
    # map :history_next,      %w[Down], %w[Control-n]
    # map :history_prev,      %w[Up], %w[Control-p]

    missing :insert_string
  end

  minor_mode :list_view_entry do
    inherits :basic, :readline

    # map :update, %w[Key]
    map :cancel,          %w[Escape], %w[Control-c]
    map :completion,      %w[Tab]
    map :line_down,       %w[Down], %w[Control-j], %w[Control-n]
    map :line_up,         %w[Up], %w[Control-k], %w[Control-p]
    map :pick_selection,  %w[Return]

    missing :insert_string
  end

  minor_mode :executor_entry do
    inherits :basic, :readline

    map :cancel,          %w[Escape], %w[Control-c]
    map :completion,      %w[Tab]
    map :line_down,       %w[Down], %w[Control-j], %w[Control-n]
    map :line_up,         %w[Up], %w[Control-k], %w[Control-p]
    map :pick_selection,  %w[Return]

    missing :insert_string
  end

  minor_mode :executor_label do
    inherits :executor_entry

    map :speed_selection,  %w[space]

    missing :insert_string
  end

  minor_mode :list_view_list do
    inherits :basic

    map :cancel,          %w[Escape], %w[Control-c]
    map :pick_selection,  %w[Return], %w[Double-Button-1]
    map :line_up,         %w[Up], %w[Control-k], %w[Control-p]
    map :line_down,       %w[Down], %w[Control-j], %w[Control-n]
  end

  minor_mode :hover_completion do
    inherits :basic

    map :cancel,               %w[Escape], %w[BackSpace]
    map :continue_completion,  %w[Right], %w[l]
    map :go_down,              %w[Down], %w[j]
    map :go_up,                %w[Up], %w[k]
    map :submit,               %w[Return]
  end

  minor_mode :snippet do
    inherits :readline

    handler VER::Methods::Snippet
    map :cancel, %w[Escape], %w[Control-c]
    map :jump,   %w[Tab]

    missing :insert_string
  end

  major_mode :Fundamental do
    use :control, :move
  end
end
