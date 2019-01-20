export *

-- Tile is an interface used to contain and draw actors
-- Grids build 2D tables of Tiles.
-- How a tile contains actors is determined by the extending class.
class Tile
  new: (@x, @y) =>

  -- Inserts an actor into the tile's internal structure
  insert: (actor) =>

  -- Removes an actor from the tile's internal structure
  remove: (actor) =>

  -- Draws any actors in the tile
  draw: =>

class SingleActorTile extends Tile
  new: (@x, @y) =>
    -- Direct reference to a single actor
    @actor = nil

  insert: (actor) =>
    @actor = actor
  
  remove: (actor) =>
    -- Remove the actor regardless of input
    @actor = nil
  
  draw: =>
    if @actor ~= nil
      @actor\draw!

class ListTile extends Tile
  new: (@x, @y) =>
    @actors = {}
  
  insert: (actor) =>
    @actors[actor.id] = actor

  remove: (actor) =>
    @actors[actor.id] = nil
  
  draw: =>
    for _, actor in pairs @actors
      actor\draw!
