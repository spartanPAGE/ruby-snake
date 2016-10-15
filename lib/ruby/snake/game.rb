#!/usr/bin/env ruby

require 'rubygems'
require 'gosu'

require 'ruby/snake/game/window'

module Ruby
  module Snake
    # Game entry point
    class GameApp
      def initialize
        @game_window = Game::Window.new
      end

      def start
        @game_window.show
      end
    end
  end
end
