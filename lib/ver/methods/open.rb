module VER
  module Methods
    module Open
      # TODO:
      # Binary files are still major fail.
      # We could try to copy behaviour of Vim or Emacs.
      # Some nice files for testing binary display are in /usr/share/terminfo
      #
      # About the nature of fail:
      # First of all, just about no font is made to have binary glyphs, even if it
      # would be nice to create a composite font, and would make editing a lot
      # nicer, it's really no option.
      #
      # Next issue is that some bytes that occur in binary files "\0" for example,
      # cause big problems for Tcl_EvalEx.
      #
      # I've tried sending the byte as:
      #   "\0", "\\0",
      #   "\x0", "\\x0",
      #   "\x00", "\\x00",
      #   "\u0000", "\\u0000"
      #
      # Tcl doesn't like that at all.
      # The first obviously sends the original \0 byte directly on, the second
      # displays in the widget as "\0", "\x0", and so on, which will lead to total
      # corruption.
      #
      # I have no idea how to work around this issue, must be some convention?
      # More important though, is to avoid sending those bytes at all, and it
      # seems to be a huge amount of work to get support for binary editing going.
      # There are much better tools for this around already, and maybe diluting
      # the normal Text buffer for this purpose will just make problems.
      #
      # For now, VER will simply fail to open files that contain \0 bytes, and
      # display binary files in a weird way.
      def open_path(path, line = 1)
        self.filename = path

        begin
          self.value = read_file(filename)
          message "Opened #{short_filename}"
        rescue Errno::ENOENT
          delete '1.0', :end
          message "Create #{short_filename}"
        end

        after_open(line)
      end

      # Read given file into memory and convert to @encoding
      def read_file(path)
        path = Pathname(path.to_s).expand_path
        encoding_name = encoding.name
        content = path.open("r:#{encoding_name}"){|io| io.read }

        unless content.valid_encoding? # take a guess
          @encoding = GUESS_ENCODING_ORDER.find{|enc|
            content.force_encoding(enc)
            content.valid_encoding?
          }

          # Now we have the source encoding, let's make it UTF-8 so Tcl can
          # handle it.
          content.force_encoding(@encoding)
          content.encode!(Encoding::UTF_8)
        end

        content.chomp
      end

      def open_empty
        delete '1.0', :end
        message "[No File]"
        after_open
      end

      def after_open(line = 1)
        VER.opened_file(self)

        edit_reset
        mark_set :insert, "#{line.to_i}.0"
        @pristine = false

        bind('<Map>'){
          defer{ setup_highlight }
          bind('<Map>'){ see(:insert) }
        }
      end
    end
  end
end
