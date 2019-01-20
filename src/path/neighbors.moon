import concat from require "lib/combine"

export *

get_side_neighbors = (grid, x, y) ->
  if x > 1
    table.insert neighbors, grid\get(x - 1, y)
  if x < grid.width
    table.insert neighbors, grid\get(x + 1, y)

get_vertical_neighbors = (grid, x, y) ->
  if y > 1
    table.insert neighbors, grid\get(x, y - 1)
  if y < grid.height
    table.insert neighbors, grid\get(x, y + 1)

get_direct_neighbors = (grid, x, y) ->
  neighbors = {}

  if x > 1 
    table.insert neighbors, grid\get x - 1, y
  if y > 1
    table.insert neighbors, grid\get x, y - 1
  if x < grid.width
    table.insert neighbors, grid\get x + 1, y
  if y < grid.height
    table.insert neighbors, grid\get x, y + 1
  
  neighbors

get_diagonal_neighbors = (grid, x, y) ->
  neighbors = {}

  if x > 1 and y > 1
    table.insert neighbors, grid\get(x - 1, y - 1)
  if x < grid.width and y > 1
    table.insert neighbors, grid\get(x + 1, y - 1)
  if x > 1 and y < grid.height
    table.insert neighbors, grid\get(x - 1, y + 1)
  if x < grid.width and y < grid.height
    table.insert neighbors, grid\get(x + 1, y + 1)
  
  neighbors

get_all_neighbors = (grid, x, y) -> concat get_direct_neighbors(grid, x, y), get_diagonal_neighbors(grid, x, y)
