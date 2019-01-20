require "path/neighbors"
import contains from require "util/table_utils"

export *

cross_path = (grid, x, y, distance, filter) ->
  start = grid\get x, y
  path = {start}

  for i = 1, math.min(distance, grid.width - x)
    tile = grid\get x + i, y
    if filter tile
      table.insert path, tile
    else
      break
  
  for i = 1, math.min(distance, x - 1)
    tile = grid\get x - i, y
    if filter tile
      table.insert path, tile
    else
      break
  
  for i = 1, math.min(distance, grid.height - y)
    tile = grid\get x, y + i
    if filter tile
      table.insert path, tile
    else
      break
  
  for i = 1, math.min(distance, y - 1)
    tile = grid\get x, y - i
    if filter tile
      table.insert path, tile
    else
      break
  
  path

a_star_direct = (grid, x, y, distance, filter) ->
  start = grid\get x, y

  closed = {}
  open = {start}

  g_score = {}
  g_score[start] = 0

  came_from = {}

  while #open > 0
    current = table.remove open, 1 
    table.insert closed, current

    for neighbor in *(get_direct_neighbors grid, current.x, current.y)

      if (contains closed, neighbor) or (not filter neighbor)
        continue
      
      temp_g = g_score[current] + 1
      
      if (not contains open, neighbor) and temp_g < distance
        table.insert open, neighbor
      
      if (g_score[neighbor] ~= nil) and (temp_g >= g_score[neighbor])
        continue
      
      came_from[neighbor] = current
      g_score[neighbor] = temp_g
  
  {destinations: closed, path: g_score}

a_star_all = (grid, x, y, distance, filter) ->
  start = grid\get x, y

  closed = {}
  open = {start}

  g_score = {}
  g_score[start] = 0

  came_from = {}

  while #open > 0
    current = table.remove open, 1 
    table.insert closed, current

    for neighbor in *(get_all_neighbors grid, current.x, current.y)

      if (contains closed, neighbor) or (not filter neighbor)
        continue
      
      temp_g = g_score[current] + 1
      
      if (not contains open, neighbor) and temp_g < distance
        table.insert open, neighbor
      
      if (g_score[neighbor] ~= nil) and (temp_g >= g_score[neighbor])
        continue
      
      came_from[neighbor] = current
      g_score[neighbor] = temp_g
  
  {destinations: closed, path: g_score}
