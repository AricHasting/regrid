tile_to_screen = function(config, x_tile, y_tile)
  local x_screen = config.x_offset + (x_tile - 1) * config.width
  local y_screen = config.y_offset + (y_tile - 1) * config.height
  return {
    x = x_screen,
    y = y_screen
  }
end
screen_to_tile = function(config, x_screen, y_screen)
  local x_tile = 1 + math.floor((x_screen - config.x_offset) / config.width)
  local y_tile = 1 + math.floor((y_screen - config.y_offset) / config.height)
  return {
    x = x_tile,
    y = y_tile
  }
end
