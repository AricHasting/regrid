local contains
contains = function(table, value)
  for _index_0 = 1, #table do
    local v = table[_index_0]
    if v == value then
      return true
    end
  end
  return false
end
local find
find = function(table, value)
  for i, v in ipairs(table) do
    if v == value then
      return i
    end
  end
  return -1
end
local keys
keys = function(t)
  local keyset = { }
  for k, _ in pairs(t) do
    table.insert(keyset, k)
  end
  return keyset
end
return {
  contains = contains,
  find = find,
  keys = keys
}
