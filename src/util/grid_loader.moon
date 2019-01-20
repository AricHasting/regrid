require "base/grid"

export *

grid_from_config = (config) ->
	return Grid config.width, config.height, config.tile