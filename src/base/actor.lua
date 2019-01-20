do
  local _class_0
  local _base_0 = {
    move = function(self, x, y)
      return self.grid:move_actor(x, y, self.id)
    end,
    destroy = function(self)
      return self.grid:remove_actor(self.id)
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self)
      self.x = 1
      self.y = 1
      self.id = -1
      self.grid = nil
    end,
    __base = _base_0,
    __name = "Actor"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Actor = _class_0
  return _class_0
end
