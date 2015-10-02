require 'require_all'
require 'gosu'
require 'gdbm'
require 'sqlite3'
require 'observer'
require 'active_record'
require 'json'
require 'launchy'
require 'yaml'

# CLI Stuff
require 'colorize'

require './environment.rb'

require './editor/window.rb'

require 'byebug'

require_all './lib/'

# GLOBAL VARIABLES

# $font_height = 24
$font_height = 16
$wwidth = 640
$wheight = 480

# Editor Config

# require('./editor/states.rb') # use this later on

$window = Editor::Window.new($wwidth,$wheight, false)

$window.show