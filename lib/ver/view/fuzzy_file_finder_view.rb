module VER
  class FuzzyFileFinderView < ListView
    attr_reader :fffinder

    def initialize(*args, &callback)
      require 'ver/vendor/fuzzy_file_finder'
      @fffinder = FuzzyFileFinder.new

      super(*args, &callback)
    end

    def update
      choices = fffinder.find(entry.value)
      choices = choices.sort_by{|m| [-m[:score], m[:path]] }

      list.clear

      choices.each do |choice|
        insert_choice(choice)
      end
    end

    def insert_choice(choice)
      path, score = choice.values_at(:path, :score)
      list.insert(:end, path)

      color =
        case score
        when 0          ; '#000'
        when 0   ..0.25 ; '#f00'
        when 0.25..0.75 ; '#ff0'
        when 0.75..1    ; '#0f0'
        end

      list.itemconfigure(:end, background: color)
    end
  end
end