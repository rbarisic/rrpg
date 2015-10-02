# environment.rb
# recursively requires all files in ./lib and down that end in .rb
# Dir.glob('./lib/*').each do |folder|
#   Dir.glob(folder +"/*.rb").each do |file|
#     require file
#   end
# end

$db_games = "data/editor/games.db"

# tells AR what db file to use
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => 'data/database.db'
)