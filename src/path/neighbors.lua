local concat
concat = require("lib/combine").concat
get_side_neighbors = function(grid, x, y)
  if x > 1 then
    table.insert(neighbors, grid:get(x - 1, y))
  end
  if x < grid.width then
    return table.insert(neighbors, grid:get(x + 1, y))
  end
end
get_vertical_neighbors = function(grid, x, y)
  if y > 1 then
    table.insert(neighbors, grid:get(x, y - 1))
  end
  if y < grid.height then
    return table.insert(neighbors, grid:get(x, y + 1))
  end
end
get_direct_neighbors = function(grid, x, y)
  local neighbors = { }
  if x > 1 then
    table.insert(neighbors, grid:get(x - 1, y))
  end
  if y > 1 then
    table.insert(neighbors, grid:get(x, y - 1))
  end
  if x < grid.width then
    table.insert(neighbors, grid:get(x + 1, y))
  end
  if y < grid.height then
    table.insert(neighbors, grid:get(x, y + 1))
  end
  return neighbors
end
get_diagonal_neighbors = function(grid, x, y)
  local neighbors = { }
  if x > 1 and y > 1 then
    table.insert(neighbors, grid:get(x - 1, y - 1))
  end
  if x < grid.width and y > 1 then
    table.insert(neighbors, grid:get(x + 1, y - 1))
  end
  if x > 1 and y < grid.height then
    table.insert(neighbors, grid:get(x - 1, y + 1))
  end
  if x < grid.width and y < grid.height then
    table.insert(neighbors, grid:get(x + 1, y + 1))
  end
  return neighbors
end
get_all_neighbors = function(grid, x, y)
  return concat(get_direct_neighbors(grid, x, y), get_diagonal_neighbors(grid, x, y))
end
