#!/usr/bin/env ruby

require 'rubygems'
require 'gosu'

require "bundler/setup"
require "ruby/snake"

Ruby::Snake::GameApp.new.start
