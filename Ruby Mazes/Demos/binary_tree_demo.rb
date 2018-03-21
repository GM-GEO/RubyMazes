require File.expand_path("../../../Ruby Mazes/Core/grid", __FILE__)
require File.expand_path("../../../Ruby Mazes/Core/Generation Algorithms/binary_tree", __FILE__)

grid = Grid.new(4, 4)
BinaryTree.on(grid)

puts grid

st = Time.new.utc.strftime('%Y%m%dT%H%M')
img = grid.to_png
img.save "binary_tree_demo" << st << ".png"