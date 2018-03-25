require File.expand_path("../../../Ruby Mazes/Core/distance_grid", __FILE__)
require File.expand_path("../../../Ruby Mazes/Core/Generation Algorithms/binary_tree", __FILE__)

grid = DistanceGrid.new(10, 10)
BinaryTree.on(grid)

start = grid[0, 0]
distances = start.distances

grid.distances = distances
puts grid

# st = Time.new.utc.strftime('%Y%m%dT%H%M')
# img = grid.to_png
# img.save "binary_tree_demo" << st << ".png"