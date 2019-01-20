do
  local _class_0
  local _base_0 = {
    insert = function(self, actor) end,
    remove = function(self, actor) end,
    draw = function(self) end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x, self.y = x, y
    end,
    __base = _base_0,
    __name = "Tile"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Tile = _class_0
end
do
  local _class_0
  local _parent_0 = Tile
  local _base_0 = {
    insert = function(self, actor)
      self.actor = actor
    end,
    remove = function(self, actor)
      self.actor = nil
    end,
    draw = function(self)
      if self.actor ~= nil then
        return self.actor:draw()
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x, self.y = x, y
      self.actor = nil
    end,
    __base = _base_0,
    __name = "SingleActorTile",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  SingleActorTile = _class_0
end
do
  local _class_0
  local _parent_0 = Tile
  local _base_0 = {
    insert = function(self, actor)
      self.actors[actor.id] = actor
    end,
    remove = function(self, actor)
      self.actors[actor.id] = nil
    end,
    draw = function(self)
      for _, actor in pairs(self.actors) do
        actor:draw()
      end
    end
  }
  _base_0.__index = _base_0
  setmetatable(_base_0, _parent_0.__base)
  _class_0 = setmetatable({
    __init = function(self, x, y)
      self.x, self.y = x, y
      self.actors = { }
    end,
    __base = _base_0,
    __name = "ListTile",
    __parent = _parent_0
  }, {
    __index = function(cls, name)
      local val = rawget(_base_0, name)
      if val == nil then
        local parent = rawget(cls, "__parent")
        if parent then
          return parent[name]
        end
      else
        return val
      end
    end,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  if _parent_0.__inherited then
    _parent_0.__inherited(_parent_0, _class_0)
  end
  ListTile = _class_0
  return _class_0
end
