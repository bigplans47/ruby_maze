require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/maze')
require('pry')

new_maze = Maze.new

get('/') do
  new_maze = Maze.new
  @read_this = new_maze.path_checkr
  erb(:index)
end

post('/next_room') do
  new_maze.navigate(params.fetch("which_way"))
  @read_this = new_maze.path_checkr
  if new_maze.win_page
    erb(:end_room)
  else
    erb(:next_room)
  end
end
