require_relative 'pane/chapter'
require_relative 'pane/code'
require_relative 'pane/list'
require_relative 'pane/text'
module TermNote
  module Pane
    attr_accessor :show, :height, :width, :rows

    def call(window_size)
      window_height, window_width = window_size
      @width = window_width - (window_width * 0.2)
      @height = window_height / 2
      clear
      render
    end

    private

    def clear
      system("clear")
    end

    def render
      puts space + formated_rows + space + footer
    end

    def gutter
      " " * (width * 0.1)
    end

    def space
      "\n" * (height - rows.size)
    end

    def footer
      "[#{show.panes.index(self) + 1}/#{show.panes.size}]".bold
    end

    def formated_rows
      rows.map { |row| gutter + row }.join("\n")
    end
  end
end
