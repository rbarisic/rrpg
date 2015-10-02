require 'colorize'
require 'sqlite3'
require 'gdbm'

require './lib/rrpg.rb'

$db = SQLite3::Database.new('./data/db.sqlite3')

# require './lib/rrpg-loader.rb'

# RRPG::Loader.load_file(ARGV.first)

@actor = RRPG::Actor.create('lol', 'mem')

# @actor.hello