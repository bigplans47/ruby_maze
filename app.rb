require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/maze')
require('pry')

new_maze = Maze.new
get('/') do
  new_maze = Maze.new
  erb(:index)
end

post('/output') do
  new_maze.navigate(params.fetch("which_way"))
  @read_this = new_maze.path_checkr
  erb(:next_room)
end
