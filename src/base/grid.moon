export *

class Grid
    -- Constructs a width x height grid of Tiles.
    -- tile_class is the classname of the Tile to use for the grid
    -- For example: Grid 10, 10, SingleActorTile
    new: (width, height, tile_class) =>
      @next_id = 0
      @width = width
      @height = height
      @actors = {}

      @tiles = {}
      for x = 1, width
        @tiles[x] = {}
        for y = 1, height
          @tiles[x][y] = tile_class x, y

    get: (x, y) =>
      @tiles[x][y]

    add_actor: (actor) =>
      -- Get a unique ID for the actor
      id = @_id!

      actor.id = id
      actor.grid = @

      -- Store the actor in the grid
      @actors[id] = actor

      -- Insert the actor into the tile
      tile = @tiles[actor.x][actor.y]
      tile\insert actor

      id
    
    update: =>
      for _, actor in pairs @actors
        actor\update!
      
    draw: =>
      for x = 1, @width
        for y = 1, @height
          @tiles[x][y]\draw!

    add_actor_at_position: (x, y, actor) =>
      actor.x, actor.y = x, y
      @add_actor actor

    move_actor: (x, y, id) =>
      a = @actors[id]
      @tiles[a.x][a.y]\remove a
      @tiles[x][y]\insert a
      a.x, a.y = x, y
    
    remove_actor: (id) =>
      a = @actors[id]
      @tiles[a.x][a.y]\remove a
      @actors[id] = nil
          
    _id: =>
      @next_id = @next_id + 1
      @next_id
