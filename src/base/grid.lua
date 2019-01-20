do
  local _class_0
  local _base_0 = {
    get = function(self, x, y)
      return self.tiles[x][y]
    end,
    add_actor = function(self, actor)
      local id = self:_id()
      actor.id = id
      actor.grid = self
      self.actors[id] = actor
      local tile = self.tiles[actor.x][actor.y]
      tile:insert(actor)
      return id
    end,
    update = function(self)
      for _, actor in pairs(self.actors) do
        actor:update()
      end
    end,
    draw = function(self)
      for x = 1, self.width do
        for y = 1, self.height do
          self.tiles[x][y]:draw()
        end
      end
    end,
    add_actor_at_position = function(self, x, y, actor)
      actor.x, actor.y = x, y
      return self:add_actor(actor)
    end,
    move_actor = function(self, x, y, id)
      local a = self.actors[id]
      self.tiles[a.x][a.y]:remove(a)
      self.tiles[x][y]:insert(a)
      a.x, a.y = x, y
    end,
    remove_actor = function(self, id)
      local a = self.actors[id]
      self.tiles[a.x][a.y]:remove(a)
      self.actors[id] = nil
    end,
    _id = function(self)
      self.next_id = self.next_id + 1
      return self.next_id
    end
  }
  _base_0.__index = _base_0
  _class_0 = setmetatable({
    __init = function(self, width, height, tile_class)
      self.next_id = 0
      self.width = width
      self.height = height
      self.actors = { }
      self.tiles = { }
      for x = 1, width do
        self.tiles[x] = { }
        for y = 1, height do
          self.tiles[x][y] = tile_class(x, y)
        end
      end
    end,
    __base = _base_0,
    __name = "Grid"
  }, {
    __index = _base_0,
    __call = function(cls, ...)
      local _self_0 = setmetatable({}, _base_0)
      cls.__init(_self_0, ...)
      return _self_0
    end
  })
  _base_0.__class = _class_0
  Grid = _class_0
  return _class_0
end
