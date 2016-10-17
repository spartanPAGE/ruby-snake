#!/usr/bin/env ruby

require 'rubygems'
require 'gosu'

require 'bundler/setup'
require 'ruby/snake'
require 'ruby/snake/game'

Ruby::Snake::GameApp.new.start
