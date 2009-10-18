module VER
  class Syntax
    autoload :Specification, 'ver/syntax/specification'

    # A hybrid of StringScanner and Regexp, uses StringScanner to simplify walking
    # and cut down code branching, and Regexp to retrieve full MatchData objects from
    # matched strings.
    class Engine < Struct.new(:spec, :scanner, :callback)
      def self.load(filename)
        Engine.new(Specification.new(filename))
      end

      def initialize(spec)
        require 'strscan'
        self.spec = spec
      end

      def parse(source, callback)
      	self.callback = callback
        callback.start_parsing(spec.name)
        parse_lines(source)
        # parse_areas(source)
        callback.end_parsing(spec.name)
      end

      def parse_areas(source)
        spec.each_area_pattern do |pattern|
          parse_area(source, pattern)
        end
      end

      def parse_area(source, pattern)
      end

      def parse_lines(source)
        source.each_line.with_index do |line, idx|
          parse_line(line, idx + 1)
        end
      end

      def parse_line(line, lineno = 1)
        spec.each_line_pattern do |pattern|
          parse_line_pattern(line, pattern, lineno)
        end
      end

      def parse_line_pattern(line, pattern, lineno)
        return unless line =~ pattern.match
        match = $~
        from, to = match.begin(0), match.end(0)

				callback.tag(pattern.name, [lineno, from], [lineno, to])


        pattern.each_capture do |key, name|
          offset_from, offset_to = match.offset(key)

          if offset_from
    				callback.tag(pattern.name, [lineno, offset_from], [lineno, offset_to])
          end

#           p match: match
#           p key: key, name: name
#           p offset_from: offset_from
#           p offset_to: offset_to
        end
      end
    end
  end
end

__END__
      def parse(source, callback)
        self.callback = callback
        self.scanner = StringScanner.new(source)
        pos = scanner.pos

        callback.start_parsing(spec.name)

        until scanner.eos?
          parse_patterns(spec.patterns)

          # go forward a character if nothing matched
          scanner.getch if pos == scanner.pos

          pos = scanner.pos
        end

        callback.end_parsing(spec.name)
      rescue => ex
        puts "#{ex.class}: #{ex}", *ex.backtrace
        exit
      end

      def parse_patterns(patterns)
        patterns.each do |pattern|
          parse_pattern(pattern)
        end
      end

      def parse_pattern(pattern)
        if pmatch = pattern.match
          parse_match(pattern, pmatch)
        elsif (pbegin = pattern.begin) && (pend = pattern.end)
          parse_begin_end(pattern, pbegin, pend)
        elsif pbegin
          # parse_begin(pattern, pbegin)
        end
      end

      def parse_match(pattern, regex)
        from = scanner.pos
        return unless scanner.scan(regex)
        on_match(pattern, regex, from)
      end

      def parse_begin_end(pattern, pbegin, pend)
        from = scanner.pos
        regex = /#{pbegin}.*?#{pend}/
        return unless scanner.scan(regex)


        # Matches which span several lines and must both be mutually exclusive with the
        # match key.
        # Each is a regular expression pattern. begin is the pattern that starts the
        # block and end is the pattern which ends the block. Captures from the begin
        # pattern an be referenced in the end pattern by using normal regular expression
        # back-references.
        if name = pattern.name
          on_begin_end_name(pattern, regex, name, from)
        # similar to name, but only assigns the name to the text between what is
        # matched by the begin/end patterns.
        elsif content_name = pattern.content_name
          on_begin_end_content_name(pattern, regex, content_name, from)
        end
      end

      def parse_begin(pattern, pbegin)
        from = scanner.pos
        regex = /#{pbegin}.*/
        return unless scanner.scan(regex)

        if name = pattern.name
          on_begin_end_name(pattern, regex, name, from)
        elsif content_name = pattern.content_name
          on_begin_end_content_name(pattern, regex, content_name, from)
        end
      end

      def on_match(pattern, regex, from)
        return unless match = scanner.string.match(regex, from)

        callback.open_tag(pattern.name, from)

        pattern.each_capture do |key, name|
          offset_from, offset_to = match.offset(key)
          # p offset_from: offset_from, offset_to: offset_to, key: key, name: name, md: md
          next unless offset_from
          callback.open_tag(name, offset_from)
          callback.close_tag(name, offset_to)
        end

        callback.close_tag(pattern.name, scanner.pos)
      end

      def on_begin_end_name(pattern, regex, name, from)
        # return unless match = scanner.string.match(regex, from)
        # p match
      end

      def on_begin_end_content_name(pattern, regex, name, from)
        # return unless match = scanner.string.match(regex, from)
        # p match
      end
    end
  end
end
