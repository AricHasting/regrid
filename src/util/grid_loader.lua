require("base/grid")
grid_from_config = function(config)
  return Grid(config.width, config.height, config.tile)
end
