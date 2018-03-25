require File.expand_path("../../../../Ruby Mazes/Core/colored_grid", __FILE__)
require File.expand_path("../../../../Ruby Mazes/Core/Generation Algorithms/binary_tree", __FILE__)

grid = ColoredGrid.new(100, 100)
BinaryTree.on(grid)

start = grid[grid.rows / 2, grid.columns / 2]

grid.distances = start.distances

puts grid

img = grid.to_png.save("colored_binary_tree_demo" << Time.new.utc.strftime('%Y%m%dT%H%M') << ".png")