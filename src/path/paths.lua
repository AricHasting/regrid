require("path/neighbors")
local contains
contains = require("util/table_utils").contains
cross_path = function(grid, x, y, distance, filter)
  local start = grid:get(x, y)
  local path = {
    start
  }
  for i = 1, math.min(distance, grid.width - x) do
    local tile = grid:get(x + i, y)
    if filter(tile) then
      table.insert(path, tile)
    else
      break
    end
  end
  for i = 1, math.min(distance, x - 1) do
    local tile = grid:get(x - i, y)
    if filter(tile) then
      table.insert(path, tile)
    else
      break
    end
  end
  for i = 1, math.min(distance, grid.height - y) do
    local tile = grid:get(x, y + i)
    if filter(tile) then
      table.insert(path, tile)
    else
      break
    end
  end
  for i = 1, math.min(distance, y - 1) do
    local tile = grid:get(x, y - i)
    if filter(tile) then
      table.insert(path, tile)
    else
      break
    end
  end
  return path
end
a_star_direct = function(grid, x, y, distance, filter)
  local start = grid:get(x, y)
  local closed = { }
  local open = {
    start
  }
  local g_score = { }
  g_score[start] = 0
  local came_from = { }
  while #open > 0 do
    local current = table.remove(open, 1)
    table.insert(closed, current)
    local _list_0 = (get_direct_neighbors(grid, current.x, current.y))
    for _index_0 = 1, #_list_0 do
      local _continue_0 = false
      repeat
        local neighbor = _list_0[_index_0]
        if (contains(closed, neighbor)) or (not filter(neighbor)) then
          _continue_0 = true
          break
        end
        local temp_g = g_score[current] + 1
        if (not contains(open, neighbor)) and temp_g < distance then
          table.insert(open, neighbor)
        end
        if (g_score[neighbor] ~= nil) and (temp_g >= g_score[neighbor]) then
          _continue_0 = true
          break
        end
        came_from[neighbor] = current
        g_score[neighbor] = temp_g
        _continue_0 = true
      until true
      if not _continue_0 then
        break
      end
    end
  end
  return {
    destinations = closed,
    path = g_score
  }
end
a_star_all = function(grid, x, y, distance, filter)
  local start = grid:get(x, y)
  local closed = { }
  local open = {
    start
  }
  local g_score = { }
  g_score[start] = 0
  local came_from = { }
  while #open > 0 do
    local current = table.remove(open, 1)
    table.insert(closed, current)
    local _list_0 = (get_all_neighbors(grid, current.x, current.y))
    for _index_0 = 1, #_list_0 do
      local _continue_0 = false
      repeat
        local neighbor = _list_0[_index_0]
        if (contains(closed, neighbor)) or (not filter(neighbor)) then
          _continue_0 = true
          break
        end
        local temp_g = g_score[current] + 1
        if (not contains(open, neighbor)) and temp_g < distance then
          table.insert(open, neighbor)
        end
        if (g_score[neighbor] ~= nil) and (temp_g >= g_score[neighbor]) then
          _continue_0 = true
          break
        end
        came_from[neighbor] = current
        g_score[neighbor] = temp_g
        _continue_0 = true
      until true
      if not _continue_0 then
        break
      end
    end
  end
  return {
    destinations = closed,
    path = g_score
  }
end
