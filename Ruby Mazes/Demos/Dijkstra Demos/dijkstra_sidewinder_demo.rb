require_relative File.expand_path("../../../Core/distance_grid", __FILE__)
require_relative File.expand_path("../../../Core/Generation Algorithms/sidewinder", __FILE__)

grid = DistanceGrid.new(10, 10)
Sidewinder.on(grid)

start = grid[0, 0]
distances = start.distances

grid.distances = distances
puts grid

puts "path from northwest corner to southwest corner:"
grid.distances = distances.path_to(grid[grid.rows - 1, 0])

puts grid.to_s

# st = Time.new.utc.strftime('%Y%m%dT%H%M')
# img = grid.to_png
# img.save "binary_tree_demo" << st << ".png"