contains = (table, value) ->
  for v in *table
    if v == value
      return true
  return false

find = (table, value) ->
  for i, v in ipairs table
    if v == value
      return i
  return -1

keys = (t) ->
  keyset = {}
  for k, _ in pairs t
    table.insert keyset, k
  keyset

{:contains, :find, :keys}