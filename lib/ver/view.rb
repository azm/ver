module VER
  class View < TkFrame
    attr_reader :text, :status, :file_path

    def initialize(parent, options = {})
      super
      setup
    end

    # +-------+---+
    # |       | @ |
    # |       | y |
    # | @text | b |
    # |       | a |
    # |       | r |
    # +-------+---+
    # | @xbar |   |
    # +-------+---+
    # |  @status  |
    # +-----------+
    def setup
      setup_text
      # setup_scrollbars
      setup_status
      setup_grid
      setup_misc
      setup_events
    end

    def setup_text
      @text = VER::Text.new(
        self,
        font: 'Terminus 9',
        undo: true,
        tabstyle: 'wordprocessor',
        tabs: ['2c', '4c', '6c'],
        autoseparators: true,
        setgrid: true,
        exportselection: true,
        borderwidth: 0,
        insertbackground: '#f00',
        insertofftime: 0
      )
    end

    def setup_scrollbars
      # vertical scrollbar
      @ybar = Ttk::Scrollbar.new(self)
      @text.yscrollbar(@ybar)

      # horizontal scrollbar
      @xbar = Ttk::Scrollbar.new(self)
      @text.xscrollbar(@xbar)
    end

    def setup_status
      # status field
      @status = Status.new(self, font: 'Terminus 9', takefocus: 0)
    end

    def setup_grid
      TkGrid.grid @text,   row: 0, column: 0, sticky: :nsew              if @text
      TkGrid.grid @ybar,   row: 0, column: 1, sticky: :ns                if @ybar
      TkGrid.grid @xbar,   row: 1, column: 0, sticky: :ew                if @xbar
      TkGrid.grid @status, row: 2, column: 0, sticky: :ew, columnspan: 2 if @status

      TkGrid.columnconfigure self, 0, weight: 1
      TkGrid.columnconfigure self, 1, weight: 0
      TkGrid.rowconfigure    self, 0, weight: 1
      TkGrid.rowconfigure    self, 1, weight: 0
    end

    def setup_misc
      @text.status = @status
      @text.view = self
    end

    def setup_events
      %w[Movement Modified].each do |name|
        @text.bind("<#{name}>"){ __send__("on_#{name.downcase}") }
      end
    end

    def open_path(path)
      @text.open_path(path)
      @text.first_highlight
    end

    # handling events

    def on_movement
      @text.see :insert
      @text.refresh_selection
      @text.status_projection(@status)
    end

    def on_modified
      @text.see :insert
      @text.refresh_highlight
      @text.status_projection(@status)
    end

    # @text.bind '<Modified>',       proc{|e| refresh; p :modified }
    # @text.bind '<Undo>',           proc{|e| refresh; p :undo }
    # @text.bind '<Redo>',           proc{|e| refresh; p :redo }
    # @text.bind '<Copy>',           proc{|e| p :copy }
    # @text.bind '<Cut>',            proc{|e| refresh; p :cut }
    # @text.bind '<Paste>',          proc{|e| refresh; p :paste }
    # @text.bind '<PasteSelection>', proc{|e| refresh; p :paste_selection }
    # @text.bind '<Movement>',       proc{|e| p :movement }
  end
end
