module VER
  # Responsibilities:
  # * Interface to Ncurses::WINDOW and Ncurses::Panel
  # * behave IO like: (print puts write read readline)
  # * hide and show itself

  # There's a very strange bug when i tried subclassing this, as Ncurses seems
  # to overwrite WINDOW::new, which will not return the Window instance we
  # want. So we have to wrap instead of subclass.
  class Window # < Ncurses::WINDOW
    attr_reader :width, :height, :top, :left
    attr_accessor :layout

    def initialize(layout)
      @visible = true
      reset_layout(layout)

      @window = Ncurses::WINDOW.new(height, width, top, left)
      @panel = Ncurses::Panel.new_panel(@window)

      Ncurses::keypad(@window, true)
    end

    def resize_with(layout)
      reset_layout(layout)
      @window.wresize(height, width)
      @window.mvwin(top, left)
    end

    def width=(w)
      return if w == width
      @layout[:width] = w
      resize_with @layout
    end

    def height=(h)
      return if h == height
      @layout[:height] = h
      resize_with @layout
    end

    def top=(t)
      return if t == top
      @layout[:top] = t
      resize_with @layout
    end

    def left=(l)
      return if l == left
      @layout[:left] = l
      resize_with @layout
    end

    def resize
      resize_with(@layout)
    end

    # Ncurses

    def pos
      return y, x
    end

    def y
      Ncurses.getcury(@window)
    end

    def x
      Ncurses.getcurx(@window)
    end

    def x=(n) move(y, n) end
    def y=(n) move(n, x) end

    def move(y, x)
      @window.move(y, x)
    end

    def method_missing(meth, *args)
      @window.send(meth, *args)
    end

    def print(string, width = width)
      return unless visible?
      @window.waddnstr(string.to_s, width)
    end

    def print_yx(string, y = 0, x = 0)
      @window.mvwaddnstr(y, x, string, width)
    end

    def print_empty_line
      return unless visible?
      @window.printw(' ' * width)
    end

    def print_line(string)
      print(string.ljust(width))
    end

    def show_colored_chunks(chunks)
      return unless visible?
      chunks.each do |color, chunk|
        color_set(color)
        print_line(chunk)
      end
    end

    def puts(*strings)
      print(strings.join("\n") << "\n")
    end

    def refresh
      return unless visible?
      @window.refresh
    end

    def wnoutrefresh
      return unless visible?
      @window.wnoutrefresh
    end

    def color=(color)
      @color = color
      @window.color_set(color, nil)
    end

    def getch
      @window.getch
    rescue Interrupt => ex
      3 # is C-c
    end

    def clear
      # return unless visible?
      move 0, 0
      puts *Array.new(height){ ' ' * (width - 1) }
    end

    # setup and reset

    def reset_layout(layout)
      @layout = layout

      [:height, :width, :top, :left].each do |name|
        instance_variable_set("@#{name}", layout_value(name))
      end
    end

    def layout_value(name)
      value = @layout[name]
      default = default_for(name)

      value = value.call(default) if value.respond_to?(:call)
      return (value || default).to_i
    end

    def default_for(name)
      case name
      when :height, :top
        Ncurses.stdscr.getmaxy
      when :width, :left
        Ncurses.stdscr.getmaxx
      else
        0
      end
    end

    # Ncurses panel

    def hide
      Ncurses::Panel.hide_panel @panel
      Ncurses.refresh # wnoutrefresh
      @visible = false
    end

    def show
      Ncurses::Panel.show_panel @panel
      Ncurses.refresh # wnoutrefresh
      @visible = true
    end

    def on_top
      Ncurses::Panel.top_panel @panel
      wnoutrefresh
    end

    def visible?
      @visible
    end
  end
end
