require File.expand_path("../../../Ruby Mazes/Core/grid", __FILE__)
require File.expand_path("../../../Ruby Mazes/Core/Generation Algorithms/aldous_broder", __FILE__)

grid = Grid.new(100, 100)
AldousBroder.on(grid)

puts grid

img = grid.to_simple_png.save("aldous_broder_demo" << Time.new.utc.strftime('%Y%m%dT%H%M') << ".png")