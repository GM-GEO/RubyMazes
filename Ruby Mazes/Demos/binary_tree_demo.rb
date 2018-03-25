require File.expand_path("../../../Ruby Mazes/Core/grid", __FILE__)
require File.expand_path("../../../Ruby Mazes/Core/Generation Algorithms/binary_tree", __FILE__)

grid = Grid.new(100, 100)
BinaryTree.on(grid)

puts grid

img = grid.to_simple_png.save("binary_tree_demo" << Time.new.utc.strftime('%Y%m%dT%H%M') << ".png")