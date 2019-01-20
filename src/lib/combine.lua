local fold
fold = function(items, fn)
  local len = #items
  if len > 1 then
    local accum = fn(items[1], items[2])
    for i = 3, len do
      accum = fn(accum, items[i])
    end
    return accum
  else
    return items[1]
  end
end
local combine
combine = function(...)
  local args = {
    ...
  }
  if #args == 0 then
    return 
  end
  if #args == 1 then
    local _ = args[1]
  end
  return fold(args, function(a, b)
    if type(b) == "table" then
      for key, val in pairs(b) do
        a[key] = val
      end
    else
      table.insert(a, b)
    end
    return a
  end)
end
local concat
concat = function(...)
  local args = {
    ...
  }
  return fold(args, function(a, b)
    for i = 1, #b do
      a[#a + 1] = b[i]
    end
    return a
  end)
end
return {
  combine = combine,
  concat = concat
}
