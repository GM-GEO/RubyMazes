require File.expand_path("../../../../Ruby Mazes/Core/colored_grid", __FILE__)
require File.expand_path("../../../../Ruby Mazes/Core/Generation Algorithms/recursive_backtracker", __FILE__)

6.times do |n|

grid = ColoredGrid.new(100, 100)
RecursiveBacktracker.on(grid)

start = grid[grid.rows / 2, grid.columns / 2]

grid.distances = start.distances

puts grid

img = grid.to_png.save("colored_recursive_backtracker_demo" << Time.new.utc.strftime('%Y%m%dT%H%M') << "_" << n.to_s << ".png")

end