export *

tile_to_screen = (config, x_tile, y_tile) ->
	x_screen = config.x_offset + (x_tile - 1) * config.width
	y_screen = config.y_offset + (y_tile - 1) * config.height
	{x: x_screen, y: y_screen}

screen_to_tile = (config, x_screen, y_screen) ->
	x_tile = 1 + math.floor (x_screen - config.x_offset) / config.width
	y_tile = 1 + math.floor (y_screen - config.y_offset) / config.height
	{x: x_tile, y: y_tile}

